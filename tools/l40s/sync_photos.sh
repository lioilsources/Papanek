#!/usr/bin/env bash
# Stáhne hotové PNG z L40S (ssh host `tcloud`) do out/photos_png a převede nové na WebP
# do app/assets/photos. Jde pouštět opakovaně během generování. Když tenhle stroj `tcloud`
# nezná, nastav v .env L40S_HOP na stroj, který ho zná (viz .env.example).
set -euo pipefail
cd "$(dirname "$0")/../.."
[ -f .env ] && . ./.env
HOP=${L40S_HOP-}
SRC=/srv/work/papanek/png/
RAW=out/photos_png
DST=app/assets/photos
mkdir -p "$RAW"
if [ -n "$HOP" ]; then
  ssh "$HOP" "mkdir -p ~/papanek-l40s/png && rsync -a --exclude 'ab_*' tcloud:$SRC ~/papanek-l40s/png/"
  rsync -a "$HOP:papanek-l40s/png/" "$RAW/"
else
  rsync -a --exclude 'ab_*' "tcloud:$SRC" "$RAW/"
fi
# Strana a kvalita podle druhu: jídlo a krok jsou velké na obrazovce, surovina a nástroj jen náhled.
size() { case $1 in hero) echo 900 ;; step) echo 800 ;; *) echo 256 ;; esac; }
qual() { case $1 in hero|step) echo 78 ;; *) echo 80 ;; esac; }
n=0
for kind in hero step ing tool; do
  [ -d "$RAW/$kind" ] || continue
  mkdir -p "$DST/$kind"
  for png in "$RAW/$kind"/*.png; do
    [ -e "$png" ] || continue
    out="$DST/$kind/$(basename "${png%.png}").webp"
    [ "$out" -nt "$png" ] && continue
    cwebp -quiet -m 6 -q "$(qual $kind)" -resize "$(size $kind)" 0 "$png" -o "$out"
    n=$((n + 1))
  done
done
echo "{\"converted\":$n}"
du -sh "$DST"/* 2>/dev/null
