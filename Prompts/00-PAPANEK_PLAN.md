# PAPÁNEK — plán pro Opus (handoff)

**Autor:** Ol1n · **Datum:** 2026-10-31 · **Stav:** koncept → MVP plán
**Repo (návrh):** `lioilsources/Papanek` · **Bundle ID:** `com.ol1n.papanek` · **Store jméno:** Papánek
**Stack:** Flutter (app, **plně offline**, vše zapečené v binárce) · Go build-time pipeline na JODA (sqlc + Postgres + pgvector, jen pro výrobu obsahu) · DGX Spark (vLLM/LiteLLM pro LLM, ComfyUI flux-schnell pro obrázky) · **žádný runtime backend**

**Rozhodnutí (31. 10. 2026):** appka offline; obsah = 50 receptů zdarma napříč kuchyněmi + **balíčky kuchyní jako non-consumable IAP**; všechny recepty i obrázky jsou v appce, nákup jen odemyká.

---

## 1. Co to je (one-liner)

Appka pro začátečníky: **ví, co mám doma, a podle toho mi vybere recept.** Když uvařím, odečte suroviny. Když něco dochází, řekne. Recepty mají hezké komiksové obrázky.

## 2. Uživatelské příběhy (MVP)

1. **Chci vařit** → otevřu appku → vidím 3–5 receptů, které **zvládnu z toho, co mám** (seřazené podle „kolik mi chybí“ a oblíbenosti).
2. **Vyberu recept** → vidím suroviny (✅ mám / ❌ chybí), porce, čas, obtížnost, komiksový obrázek → tlačítko **Vařit**.
3. **Režim vaření** → velké kroky, jeden krok na obrazovku, časovače, obrázek ke kroku, „Další“ hlasem nebo klepnutím.
4. **Uvařeno** → appka odečte spotřebované suroviny ze spíže → zeptá se „Jak to dopadlo?“ (👍/👎/poznámka).
5. **Dochází / kazí se** → notifikace „Dochází mléko“ / „Kuřecí má 1 den“ → tlačítko „Na nákup“.
6. **Nákupní seznam** → automaticky z chybějících surovin + docházejících + ručně → po nákupu „Nakoupeno“ → přičte do spíže.
7. **Přidat co mám** → text s našeptávačem, hlas, **čárový kód**, **fotka účtenky (OCR)**, fotka lednice (později).

## 3. Zapomenuté / doplněné požadavky (vs. původní brief)

| Oblast | Proč to tam musí být |
|---|---|
| Nákupní seznam | Přirozený výstup z „chybí mi“ + „dochází“. Bez něj je spíž slepá ulička. |
| Ontologie surovin + jednotek | Matching „co mám doma“ nefunguje bez kanonizace (cibule = žlutá cibule, 1 ks ≈ 120 g, lžíce = 15 ml). |
| Staples (sůl, pepř, olej, voda, cukr) | Nepočítají se do „chybí“. Uživatel je může vypnout. |
| Trvanlivost | Čerstvé položky mají `expires_at` (default dle kategorie) → notifikace „dojez“. |
| Porce | Recept uložen na N porcí, škálování 1–8, odečet úměrně. |
| Režim vaření | Mokré ruce → velké tlačítko / hlas / časovače. |
| Náhrady | `substitutions` tabulka (smetana → jogurt, máslo → olej) → „můžeš uvařit s náhradou“. |
| Filtry | čas, obtížnost, alergeny, dieta (veg/vegan/bezlepku), kuchyně, počet chybějících. |
| Historie + hodnocení | Feedback do rankingu, „co jsem vařil minulý týden“. |
| Domácnost | Bez serveru = bez sdílené spíže v MVP. Později export/import spíže (QR / soubor), ne sync. |
| Legálnost zdroje receptů | Viz §5 — ne „stáhnout všechno“, ale extrakce dat + vlastní přepis + vlastní obrázky. |
| Offline | Vše v appce: recepty, obrázky, ontologie, spíž (SQLite/Drift). Žádné síťové volání za běhu kromě IAP a volitelně čárových kódů. |
| Velikost appky | 2 000 receptů × hero WebP ≈ 100–150 MB → rozpočet, viz §10a. |
| Aktualizace obsahu | Nový obsah = nová verze appky. OTA balíčky (GitHub Pages jako Pohádkomat) jako možný v2 krok, ne teď. |
| Jazyky | CZ first, EN druhý; schéma vícejazyčné od začátku (`recipe_translations`). |

## 4. Architektura

```
 BUILD TIME (JODA + Spark)                        RUNTIME (telefon)
┌──────────────────────┐                         ┌──────────────────────┐
│ Postgres + pgvector  │   papanek-export        │ Flutter app          │
│ ingest → enrich      │ ──────────────────────► │ assets/content.db    │
│ (vLLM, ComfyUI)      │   content.db (SQLite)   │ assets/img/*.webp    │
└──────────────────────┘   + webp + embeddings   │ Drift: spíž, nákup,  │
                                                 │ cook_log, IAP stav   │
                                                 │ lokální notifikace   │
                                                 └──────────────────────┘
```

**Princip:** veškerá inteligence (LLM, embeddingy, obrázky, kategorizace) proběhne **jednou při výrobě obsahu** na Sparku. Výstup je jeden **read-only SQLite `content.db`** + obrázky, zapečené jako Flutter assets. Appka za běhu nevolá žádný server. Dvě DB v appce: `content.db` (read-only, verze = verze appky) a `user.db` (spíž, nákup, historie, nákupy — Drift).

**Nástroje (Go, jeden repo, více binárek — jen build-time):**
- `papanek-ingest` — extrakce/normalizace receptů (batch).
- `papanek-enrich` — LLM přepis, kategorizace, embeddingy, generování obrázků (batch, fronta jako v AiStack).
- `papanek-export` — Postgres → `content.db` + optimalizované WebP + manifest balíčků; spouští se před každým releasem.
- Notifikace: čistě **lokální** (flutter_local_notifications), plánují se při změně spíže.

## 5. Získávání receptů (ingest)

**Nestahovat „celý internet“ naslepo.** Strategie:

1. **Strukturovaná data** — většina receptových webů má `schema.org/Recipe` JSON-LD (ingredients, instructions, cookTime, cuisine, image). Extrahovat **jen data** (seznam surovin + kroky), ne texty ani fotky. Respektovat `robots.txt`, rate-limit, User-Agent s kontaktem.
2. **Otevřené datasety** jako základ: RecipeNLG, Recipe1M+, OpenRecipes, Food.com (Kaggle), Wikibooks Cookbook (CC BY-SA). Pro češtinu: ověřit licence CZ webů (recepty.cz, toprecepty.cz, vareni.cz, kucharka pro dceru) — pravděpodobně ne; použít jako **inspiraci pro seznam jídel**, ne jako zdroj textu.
3. **LLM přepis** — každý recept projde modelem na Sparku: přepsat kroky **vlastními slovy pro začátečníka** (kratší věty, vysvětlit „orestovat“, „al dente“), sjednotit formát, doplnit tipy. Výsledek je náš text. Seznam surovin jako faktický údaj není autorské dílo.
4. **Deduplikace** — hash normalizovaných surovin + embedding similarity > 0.95 → merge, zachovat varianty.
5. **Obrázky** — všechny vlastní (flux-schnell), nikdy nestahovat cizí fotky.

**Cíl pro MVP:** ~1 500–2 000 receptů rozdělených do balíčků, ne 200 000. Kvalita > kvantita. Začátečník nechce 50 variant guláše.

**Balíčky (návrh):**
| Balíček | Recepty | Poznámka |
|---|---|---|
| Zdarma | 50 | 5–8 z každé kuchyně, nejlepší „hned z toho, co mám“ recepty — ukázka hodnoty |
| Česká | 300 | |
| Italská | 250 | |
| Vietnamská | 150 | |
| Asijská (thajská, čínská, japonská, indická) | 300 | |
| Mexická & středomořská | 200 | |
| Rychlá & studentská | 200 | průřez, pro úplné začátečníky |
| Dětská / rodinná | 150 | |

Každý recept má `pack_id`; 50 zdarma mají `pack_id = free`. Balíček je viditelný v appce i nezakoupený (titulky + obrázky + „zamčeno“), což je zároveň upsell.

## 6. Datový model (Postgres)

```sql
-- kanonické suroviny
ingredients(id, canonical_name_cs, canonical_name_en, category, -- zelenina/maso/mléčné/koření/...
            default_unit, grams_per_piece, is_staple, default_shelf_days, allergens[])
ingredient_aliases(ingredient_id, alias, lang)   -- "cibule žlutá", "onion", "cibulka"
units(id, name, kind)                              -- g, ml, ks, lžíce, hrnek
unit_conversions(from_unit, to_unit, ingredient_id NULL, factor)
substitutions(ingredient_id, substitute_id, ratio, note)

packs(id, name_cs, name_en, product_id_ios, product_id_android, sort, cover_image)
recipes(id, slug, pack_id, cuisine, difficulty 1-3, prep_min, cook_min, servings,
        source_url, source_license, status, image_file, hero_prompt, embedding vector(1024))
recipe_translations(recipe_id, lang, title, summary, steps jsonb, tips)
recipe_ingredients(recipe_id, ingredient_id, qty, unit, optional bool, note)
recipe_tags(recipe_id, tag)                        -- vegan, rychlé, bezlepku, dětem

-- ^ vše výše = content.db (read-only, v assets, bez household/users)

-- user.db (Drift, zapisovatelná, na telefonu)
pantry_items(id, ingredient_id, qty, unit, expires_at, added_via, updated_at)
pantry_events(id, ingredient_id, delta, reason, recipe_id NULL, at)  -- audit log
custom_ingredients(id, name, category, unit)          -- "appka to nezná, ale já to mám"
shopping_items(id, ingredient_id NULL, free_text, qty, unit, done, source)
cook_log(id, recipe_id, servings, rating, note, at)
purchases(pack_id, purchased_at, receipt_hint)         -- cache stavu IAP, zdroj pravdy je store
settings(key, value)
```

Spíž se počítá jako **event-sourced** (`pantry_events`) → `pantry_items` je materializovaný stav. Umožní „vrátit zpět“ a výpočet „často kupovaných“ (dopočítá se z events, netřeba tabulka). Export/import `user.db` (soubor nebo QR) = přenos mezi telefony bez serveru.

## 7. Normalizace surovin (nejdůležitější kus)

Pipeline pro každý řádek ingredience ze zdroje (`"2 velké cibule, nakrájené"`):
1. Regex/parser: množství (`2`, `1/2`, `1-2`), jednotka (`ks`, `g`, `lžíce`), název, poznámka.
2. Lookup v `ingredient_aliases` (trigram + lowercase + lematizace).
3. Fallback: embedding nearest-neighbour nad `ingredients` (práh), pak LLM klasifikace s výběrem z top-5.
4. Neznámé → fronta na ruční review (admin web, jednoduchý).

Seed ontologie: ~600 surovin ručně (LLM vygeneruje první verzi, Ol1n projde). Bez tohoto kroku nic dalšího nedává smysl → **udělat jako první**.

## 8. Matching „co můžu uvařit“

Pro každý recept a domácnost:
```
missing   = ingredience (ne optional, ne staple) bez dostatečného qty ve spíži (po konverzi jednotek)
coverage  = 1 - missing / required
score     = coverage*0.5 + uses_expiring*0.2 + rating_affinity*0.15 + popularity*0.1 + quick_bonus*0.05
```
- Vracet skupiny: **„Můžeš hned“** (missing=0), **„Chybí 1 věc“**, **„Chybí 2–3“**, **„S náhradou“**.
- „Uses expiring“ tlačí recepty, které spotřebují, co se kazí.
- SQL nad lokální SQLite v appce — žádný síťový round-trip. Zamčené recepty se **počítají taky** (ukázat „mohl bys uvařit X z balíčku Italská“ = upsell).

## 9. RAG — offline varianta

Žádný LLM za běhu. „RAG“ se rozpadá na dvě věci:
- **Vyhledávání receptů** — MVP: SQLite **FTS5** nad názvy, surovinami, tagy (CZ+EN, s diakritikou i bez) + strukturované filtry. To pokryje 90 % dotazů typu „kuře rýže rychlé“. **v1.1:** předpočítané embeddingy receptů (`multilingual-e5-small`, 384 dim, ~3 MB float16 na 2 000 receptů) + stejný model on-device (ONNX Runtime / `fonnx`, ~120 MB → zvážit, jestli stojí za velikost). Rozhodnout až podle toho, jak FTS stačí.
- **Otázky při vaření** — předpočítané při výrobě obsahu: **glosář** (~200 pojmů: blanšírovat, al dente, restovat… s obrázkem) odkazovaný z kroků jako tooltip, + **FAQ per recept** (3–5 otázek vygenerovaných LLM: „můžu místo smetany…“, „jak poznám, že je hotové“). Uživatel nepíše dotaz, klepne na pojem nebo otevře FAQ.
- Embeddingy při výrobě: `bge-m3` / `multilingual-e5-large` v pgvector — pro dedup a kategorizaci, do appky se exportují jen pokud bude v1.1.

## 10. Obrázky (komiksový styl)

- **Jeden styl pro celou appku**: čistý komiks / flat ilustrace, výrazné obrysy, teplé barvy, bez textu v obrázku. Vyzkoušet 3 style-prompty, Ol1n vybere, zafixovat jako `STYLE_PROMPT` + případně LoRA (viz realeyes workflow).
- Per recept: **hero obrázek** (jídlo na talíři) + volitelně **1 obrázek na krok** (ikonka akce: krájení, smažení…) — kroky lze sdílet z knihovny ~40 generických akcí místo generování per recept.
- Per surovina: **ikonka** (600 ks, jednou) → používá se ve spíži a nákupním seznamu.
- Batch na Sparku přes ComfyUI (flux-schnell, 1024², ~2 s/obr) → do appky jako assets (viz §10a).
- Validace: CLIP skóre prompt↔obrázek, odmítnout < práh, přegenerovat (stejný pattern jako filtr zvuků u Pohádkomatu).

## 10a. Rozpočet velikosti appky

Vše zapečené → velikost je hlavní technický limit.

| Položka | Počet | Formát | Odhad |
|---|---|---|---|
| Hero recept | 2 000 | WebP 768×768 q75 | ~50 KB → **100 MB** |
| Hero thumbnail (seznamy) | 2 000 | WebP 256×256 | ~8 KB → 16 MB |
| Ikony surovin | 600 | WebP 256×256 | ~8 KB → 5 MB |
| Ikony kroků (knihovna) | 40 | WebP 512 | <1 MB |
| content.db | – | SQLite | ~15 MB (FTS index) |
| **Celkem** | | | **~140 MB** |

- Pravidla: **žádný obrázek na krok per recept** (jen sdílená knihovna akcí), jedna velikost hero (ne 3), q75, `cwebp -m 6`.
- Pokud > 150 MB: snížit hero na 640², nebo **Play Asset Delivery (install-time)** / **iOS On-Demand Resources** per balíček — obsah je pořád „v appce“ z pohledu storu, jen se stahuje po instalaci. Držet to jako plán B, ne jako default.
- Apple: limit 4 GB, nad 200 MB varování na mobilních datech (ne blokace). Play: AAB base ≤ 200 MB, asset packs do 2 GB.
- Zamčený obsah v binárce je u obou storů v pořádku (IAP odemyká zapečený obsah).

## 11. Spíž — vstupy

| Způsob | MVP | Poznámka |
|---|---|---|
| Text s našeptávačem | ✅ | fuzzy nad `ingredient_aliases`, lokálně |
| Hlas | ✅ | speech-to-text platformy, pak stejný parser |
| Čárový kód | ✅ | **Offline**: z Open Food Facts dumpu vyfiltrovat produkty s CZ/SK trhem (~150 k EAN → ~5 MB tabulka `ean → ingredient_id`) a zapéct do content.db. Neznámé EAN → ruční přiřazení v appce (uloží se do user.db). Online dotaz na OFF jako volitelný fallback, ne nutný. |
| Fotka účtenky | v1.1 | OCR ML Kit on-device + jednoduchý řádkový parser (bez LLM); řádky → fuzzy match na aliasy |
| Fotka lednice | v2 | vyžaduje VLM → buď on-device malý model, nebo vůbec; nezávazně |
| „Nakoupeno“ ze seznamu | ✅ | jedno klepnutí přičte vše |

**Odečet po vaření:** navrhnout odečet, uživatel může upravit (uvařil jsem jen půlku). Nikdy neodečítat bez potvrzení.

**Docházení:** práh per surovina = `min(frequent_items typical_qty * 0.25, …)`; staples mají vlastní „mám / nemám“ toggle bez množství.

## 12. Flutter app — obrazovky

1. **Domů / Chci vařit** — karty receptů ve skupinách (§8), filtr chip bar.
2. **Recept** — hero obrázek, suroviny ✅/❌ s tlačítkem „na nákup“, porce slider, čas, obtížnost, „Vařit“.
3. **Vaření** — fullscreen kroky, časovače, hlasové „další“, na konci „Hotovo → odečíst“.
4. **Spíž** — seznam podle kategorií s ikonkami, badge „dochází“/„kazí se“, FAB přidat (text/hlas/kód).
5. **Nákup** — checklist, seskupení podle kategorie obchodu, „Nakoupeno“.
6. **Kuchyně / Obchod** — mřížka balíčků s obálkou, počtem receptů, cenou; „Obnovit nákupy“.
7. **Nastavení** — alergie, dieta, staples toggle, jazyk, notifikace, export/import spíže.

Design: cute/komiks, velké fonty, min. tapů. Lze zvážit `cute_kid_fonts`? — spíš ne, cílovka jsou dospělí začátečníci; ale stejná vizuální přívětivost.

## 13. Monetizace

- **Zdarma:** 50 receptů napříč kuchyněmi + celá spíž, nákupní seznam, notifikace, režim vaření — plná funkčnost, omezený obsah.
- **Balíčky kuchyní:** non-consumable IAP (StoreKit 2 / Play Billing přes `in_app_purchase`), ceny cca 49–79 Kč / 1,99–2,99 €. „Vše“ bundle za sníženou cenu.
- **Ol1n Pass** odemkne všechny balíčky (konzistentní s [[ol1n-pass]]) — ověření Passu musí fungovat offline (lokální stav IAP, obnovení nákupů při online).
- Bez reklam, bez účtu, bez sběru dat (Play: nesbírá data; věková kategorie 13+).
- Product ID konvence: `com.ol1n.papanek.pack.czech`, `.italian`, … + `.all`.

## 14. Milníky

**M0 — Ontologie (1 týden)**
- Seed 600 surovin + aliasy + jednotky + konverze + staples + shelf days. Admin CLI pro review.
- Test: 95 % řádků z 200 náhodných receptů se namapuje automaticky.

**M1 — Ingest + enrich (1–2 týdny)**
- Extraktor schema.org + loader otevřených datasetů. Normalizace. Dedup. LLM přepis CZ pro začátečníky. Embeddingy. 2 000 receptů v DB.
- Hero obrázky pro všech 2 000 + 600 ikon surovin.

**M2 — Export pipeline (3–4 dny)**
- `papanek-export`: Postgres → `content.db` (recepty, překlady, ontologie, FTS index, EAN mapa, glosář, FAQ, manifest balíčků) + WebP assets. Reprodukovatelný, verzovaný (`content_version` v DB). Změření velikosti vs. §10a.

**M3 — Flutter MVP (2–3 týdny)**
- 7 obrazovek, `content.db` z assets (kopie do app dir při prvním startu / při změně verze), `user.db` Drift, matching lokálně, FTS hledání, text/hlas/kód vstup, režim vaření, odečet, lokální notifikace, IAP balíčky + obnovení nákupů, export/import spíže.

**M4 — Beta (1 týden)**
- TestFlight + Play internal, sandbox IAP. Ol1n vaří týden podle appky. Ladit prahy, ontologii, styl obrázků, velikost.

**M5 — Release**
- Store assets, CZ+EN texty, Ol1n Pass integrace, balíčky založené v ASC + Play Console.

## 15. Otevřené otázky pro Ol1na

1. Název „Papánek“ — ověřit kolizi na App Store / Play / ochranné známky (CZ).
2. Seznam balíčků a jejich ceny (návrh v §5 a §13) — potvrdit/upravit.
3. Styl obrázků: udělám 3 ukázky (flat komiks / manga / akvarel-komiks) — vybereš.
4. Strop velikosti appky: 150 MB ok, nebo chceš pod 100 MB (= menší hero obrázky / méně receptů)?
5. Nutriční hodnoty — ano/ne? (data jsou v otevřených datasetech, přidá to práci na normalizaci)
6. Vektorové hledání on-device (v1.1, +~120 MB kvůli modelu) — spíš ne, FTS by měla stačit; souhlas?

## 16. Rizika

- **Ontologie je bottleneck** — podcenit = matching nefunguje = appka nemá smysl. Proto M0.
- **Licence zdrojů** — držet se extrakce dat + vlastního přepisu + vlastních obrázků; logovat `source_license`.
- **Ruční zadávání spíže** — pokud bude otravné, uživatel odpadne. Čárový kód a „Nakoupeno“ jsou klíčové.
- **Jeden Spark** — sdílený s Pohádkomatem, dabingem atd. → batch v noci, fronta s prioritou.
- **Velikost binárky** — hlídat od M2; při překročení plán B z §10a (asset delivery per balíček).
- **Obsah = release** — oprava překlepu v receptu znamená novou verzi appky. Akceptováno; OTA až ve v2.

## 17. Co má Opus udělat jako první

1. Založit repo `lioilsources/Papanek` (Go monorepo `tools/` + `app/` Flutter), migrace, sqlc; `content.db` schéma jako první artefakt, aby Flutter mohl začít paralelně nad prázdnou DB.
2. **M0**: vygenerovat seed ontologie (600 surovin, CZ/EN aliasy, kategorie, jednotky, staples, shelf days) do `seed/ingredients.yaml` + parser + testy na 200 reálných řádcích.
3. Extraktor schema.org/Recipe + loader Wikibooks Cookbook jako první legální zdroj.
4. Zpráva Ol1novi: 3 style-prompty + 3 testovací obrázky z ComfyUI.
