// papanek-enrich je dávková výroba obsahu na Sparku (plán §4). Zatím umí jen
// ukázky stylů z §15 bod 3. Spouštět vždy přes broker:
//
//	sparkctl exec papanek comfyui,flux-schnell 20 5 "style samples" --dir tools -- \
//	  go run ./cmd/papanek-enrich styles -out ../out/styles
package main

import (
	"bytes"
	"encoding/json"
	"flag"
	"fmt"
	"io"
	"log"
	"net/http"
	"net/url"
	"os"
	"path/filepath"
	"time"
)

// Tři kandidáti na STYLE_PROMPT; vítěz se zafixuje pro celou appku (§10).
var styles = map[string]string{
	"flat-komiks": "clean flat comic illustration, bold uniform black outlines, simple cel shading, warm friendly colours, plain cream background, no text",
	"manga":       "japanese manga food illustration, confident ink linework, screentone shading, soft pastel colour accents, plain light background, no text",
	"akvarel":     "watercolour comic illustration, loose ink outlines, soft washes of warm colour, visible paper texture, plain off-white background, no text",
}

// Vlastní popisy jídel: jedno české, jedno italské, jedno vietnamské (§5).
var dishes = map[string]string{
	"gulas":     "a plate of Czech beef goulash with bread dumplings and sliced onion, seen from slightly above",
	"carbonara": "a plate of spaghetti carbonara with crispy guanciale and grated cheese, seen from slightly above",
	"pho":       "a bowl of Vietnamese pho with rice noodles, sliced beef, fresh herbs and lime, seen from slightly above",
}

func workflow(prompt string, seed int64, prefix string) map[string]any {
	node := func(class string, in map[string]any) map[string]any {
		return map[string]any{"class_type": class, "inputs": in}
	}
	return map[string]any{
		"10": node("UNETLoader", map[string]any{"unet_name": "flux1-schnell.safetensors", "weight_dtype": "fp8_e4m3fn"}),
		"11": node("DualCLIPLoader", map[string]any{"clip_name1": "t5xxl_fp16.safetensors", "clip_name2": "clip_l.safetensors", "type": "flux"}),
		"12": node("VAELoader", map[string]any{"vae_name": "ae.safetensors"}),
		"14": node("CLIPTextEncode", map[string]any{"text": prompt, "clip": []any{"11", 0}}),
		"15": node("CLIPTextEncode", map[string]any{"text": "", "clip": []any{"11", 0}}),
		"17": node("EmptySD3LatentImage", map[string]any{"width": 1024, "height": 1024, "batch_size": 1}),
		"18": node("KSampler", map[string]any{"seed": seed, "steps": 4, "cfg": 1.0, "sampler_name": "euler", "scheduler": "simple", "denoise": 1.0,
			"model": []any{"10", 0}, "positive": []any{"14", 0}, "negative": []any{"15", 0}, "latent_image": []any{"17", 0}}),
		"19": node("VAEDecode", map[string]any{"samples": []any{"18", 0}, "vae": []any{"12", 0}}),
		"20": node("SaveImage", map[string]any{"filename_prefix": prefix, "images": []any{"19", 0}}),
	}
}

func main() {
	if len(os.Args) < 2 || os.Args[1] != "styles" {
		log.Fatal("použití: papanek-enrich styles [-comfy URL] [-out DIR]")
	}
	fs := flag.NewFlagSet("styles", flag.ExitOnError)
	comfy := fs.String("comfy", "http://192.168.88.66:8188", "ComfyUI")
	out := fs.String("out", "../out/styles", "výstupní adresář")
	_ = fs.Parse(os.Args[2:])
	if err := os.MkdirAll(*out, 0o755); err != nil {
		log.Fatal(err)
	}
	ok, failed := 0, 0
	for style, sp := range styles {
		for dish, dp := range dishes {
			name := style + "_" + dish
			if err := render(*comfy, dp+", "+sp, name, *out); err != nil {
				log.Printf("%s: %v", name, err)
				failed++
				continue
			}
			ok++
		}
	}
	// Poslední řádek jde do souhrnu brokeru.
	fmt.Printf(`{"images":{"ok":%d,"failed":%d}}`+"\n", ok, failed)
	if failed > 0 {
		os.Exit(1)
	}
}

func render(base, prompt, name, out string) error {
	body, _ := json.Marshal(map[string]any{"prompt": workflow(prompt, 20261031, "papanek/"+name)})
	resp, err := http.Post(base+"/prompt", "application/json", bytes.NewReader(body))
	if err != nil {
		return err
	}
	defer resp.Body.Close()
	var sub struct {
		ID string `json:"prompt_id"`
	}
	raw, _ := io.ReadAll(resp.Body)
	if json.Unmarshal(raw, &sub) != nil || sub.ID == "" {
		return fmt.Errorf("odmítnuto: %s", raw)
	}
	deadline := time.Now().Add(15 * time.Minute) // fronta ComfyUI může být obsazená
	for time.Now().Before(deadline) {
		time.Sleep(2 * time.Second)
		img, err := output(base, sub.ID)
		if err != nil {
			return err
		}
		if img != "" {
			return download(base+"/view?"+img, filepath.Join(out, name+".png"))
		}
	}
	return fmt.Errorf("vypršel čas, prompt %s", sub.ID)
}

func output(base, id string) (string, error) {
	resp, err := http.Get(base + "/history/" + id)
	if err != nil {
		return "", err
	}
	defer resp.Body.Close()
	var h map[string]struct {
		Outputs map[string]struct {
			Images []struct {
				Filename  string `json:"filename"`
				Subfolder string `json:"subfolder"`
				Type      string `json:"type"`
			} `json:"images"`
		} `json:"outputs"`
	}
	if err := json.NewDecoder(resp.Body).Decode(&h); err != nil {
		return "", err
	}
	for _, o := range h[id].Outputs {
		for _, i := range o.Images {
			return url.Values{"filename": {i.Filename}, "subfolder": {i.Subfolder}, "type": {i.Type}}.Encode(), nil
		}
	}
	return "", nil
}

func download(u, path string) error {
	resp, err := http.Get(u)
	if err != nil {
		return err
	}
	defer resp.Body.Close()
	if resp.StatusCode != http.StatusOK {
		return fmt.Errorf("view: HTTP %d", resp.StatusCode)
	}
	f, err := os.Create(path)
	if err != nil {
		return err
	}
	defer f.Close()
	_, err = io.Copy(f, resp.Body)
	return err
}
