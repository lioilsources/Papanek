#!/usr/bin/env python3
"""Fotky Papánku na L40S přes ComfyUI (profil D, :8188).

Čte JSONL od `papanek-enrich photos`, drží ve frontě ComfyUI několik úloh naráz
(MODEL_NOTES: rychlá workflow jinak čekají na předání), PNG stahuje přes /view do
--out/<name>.png. Hotové soubory přeskakuje, takže běh jde kdykoli přerušit a pustit znovu.

  python3 run_photos.py jobs.jsonl --out /srv/work/papanek/png [--model qwen|schnell] [--only hero/] [--limit 6]
"""
import argparse, json, os, sys, time, urllib.parse, urllib.request

BASE = "http://127.0.0.1:8188"
NEG = ("cartoon, illustration, drawing, painting, anime, 3d render, cgi, text, letters, watermark, logo, "
       "deformed hands, extra fingers, blurry, low quality")


def wf(model, prompt, seed, prefix, size):
    if model == "schnell":
        return {
            "ck": {"class_type": "CheckpointLoaderSimple", "inputs": {"ckpt_name": "flux1-schnell-fp8.safetensors"}},
            "p": {"class_type": "CLIPTextEncode", "inputs": {"text": prompt, "clip": ["ck", 1]}},
            "n": {"class_type": "CLIPTextEncode", "inputs": {"text": "", "clip": ["ck", 1]}},
            "l": {"class_type": "EmptySD3LatentImage", "inputs": {"width": size, "height": size, "batch_size": 1}},
            "k": {"class_type": "KSampler", "inputs": {"seed": seed, "steps": 4, "cfg": 1.0, "sampler_name": "euler",
                  "scheduler": "simple", "denoise": 1.0, "model": ["ck", 0], "positive": ["p", 0],
                  "negative": ["n", 0], "latent_image": ["l", 0]}},
            "d": {"class_type": "VAEDecode", "inputs": {"samples": ["k", 0], "vae": ["ck", 2]}},
            "s": {"class_type": "SaveImage", "inputs": {"images": ["d", 0], "filename_prefix": prefix}},
        }
    return {
        "u": {"class_type": "UNETLoader", "inputs": {"unet_name": "qwen_image_fp8_e4m3fn.safetensors", "weight_dtype": "default"}},
        "c": {"class_type": "CLIPLoader", "inputs": {"clip_name": "qwen_2.5_vl_7b_fp8_scaled.safetensors", "type": "qwen_image"}},
        "v": {"class_type": "VAELoader", "inputs": {"vae_name": "qwen_image_vae.safetensors"}},
        "ms": {"class_type": "ModelSamplingAuraFlow", "inputs": {"model": ["u", 0], "shift": 3.1}},
        "p": {"class_type": "CLIPTextEncode", "inputs": {"text": prompt, "clip": ["c", 0]}},
        "n": {"class_type": "CLIPTextEncode", "inputs": {"text": NEG, "clip": ["c", 0]}},
        "l": {"class_type": "EmptySD3LatentImage", "inputs": {"width": size, "height": size, "batch_size": 1}},
        "k": {"class_type": "KSampler", "inputs": {"seed": seed, "steps": 20, "cfg": 2.5, "sampler_name": "euler",
              "scheduler": "simple", "denoise": 1.0, "model": ["ms", 0], "positive": ["p", 0],
              "negative": ["n", 0], "latent_image": ["l", 0]}},
        "d": {"class_type": "VAEDecode", "inputs": {"samples": ["k", 0], "vae": ["v", 0]}},
        "s": {"class_type": "SaveImage", "inputs": {"images": ["d", 0], "filename_prefix": prefix}},
    }


def call(path, body=None):
    req = urllib.request.Request(BASE + path, data=json.dumps(body).encode() if body else None,
                                 headers={"Content-Type": "application/json"})
    with urllib.request.urlopen(req, timeout=60) as r:
        return r.read()


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("jobs")
    ap.add_argument("--out", required=True)
    ap.add_argument("--model", help="přebije model z JSONL")
    ap.add_argument("--only", default="", help="jen úlohy s tímto prefixem jména")
    ap.add_argument("--limit", type=int, default=0)
    ap.add_argument("--size", type=int, default=1024)
    ap.add_argument("--depth", type=int, default=3, help="úloh naráz ve frontě ComfyUI")
    a = ap.parse_args()

    jobs = [json.loads(l) for l in open(a.jobs) if l.strip()]
    todo = []
    for j in jobs:
        if a.model:
            j["model"] = a.model
        if not j["name"].startswith(a.only):
            continue
        if os.path.exists(os.path.join(a.out, j["name"] + ".png")):
            continue
        todo.append(j)
    # Jeden model po druhém: oba se do 46 GB naráz nevejdou a přepínání stojí desítky sekund.
    todo.sort(key=lambda j: j["model"])
    if a.limit:
        todo = todo[: a.limit]
    print(json.dumps({"todo": len(todo), "skipped": len(jobs) - len(todo)}), flush=True)

    pending, done, failed, t0 = {}, 0, 0, time.time()
    it = iter(todo)
    exhausted = False
    while pending or not exhausted:
        while not exhausted and len(pending) < a.depth:
            j = next(it, None)
            if j is None:
                exhausted = True
                break
            try:
                r = json.loads(call("/prompt", {"prompt": wf(j["model"], j["prompt"], j["seed"] % 2**32,
                                                              "papanek/" + j["name"].replace("/", "_"), a.size)}))
                pending[r["prompt_id"]] = (j, time.time())
            except Exception as e:  # odmítnutý workflow: zapsat a jet dál
                print(json.dumps({"name": j["name"], "error": str(e)}), flush=True)
                failed += 1
        time.sleep(0.5)
        for pid in list(pending):
            j, ts = pending[pid]
            h = json.loads(call("/history/" + pid)).get(pid)
            if not h:
                if time.time() - ts > 900:
                    print(json.dumps({"name": j["name"], "error": "timeout"}), flush=True)
                    del pending[pid]
                    failed += 1
                continue
            imgs = [i for o in h.get("outputs", {}).values() for i in o.get("images", [])]
            del pending[pid]
            if not imgs:
                print(json.dumps({"name": j["name"], "error": "no output", "status": h.get("status")}), flush=True)
                failed += 1
                continue
            i = imgs[0]
            q = urllib.parse.urlencode({"filename": i["filename"], "subfolder": i["subfolder"], "type": i["type"]})
            dst = os.path.join(a.out, j["name"] + ".png")
            os.makedirs(os.path.dirname(dst), exist_ok=True)
            with urllib.request.urlopen(BASE + "/view?" + q, timeout=60) as r, open(dst + ".tmp", "wb") as f:
                f.write(r.read())
            os.replace(dst + ".tmp", dst)
            done += 1
            el = time.time() - t0
            print(json.dumps({"done": done, "of": len(todo), "name": j["name"], "model": j["model"],
                              "s_per_img": round(el / done, 2)}), flush=True)
    print(json.dumps({"images": {"ok": done, "failed": failed}}), flush=True)
    sys.exit(1 if failed else 0)


if __name__ == "__main__":
    main()
