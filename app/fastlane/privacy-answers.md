# Odpovědi do formulářů o soukromí

Pro první build s anonymními statistikami (`docs/telemetry.md`, PR „Anonymní
statistiky používání“). **Vyplnit až po zveřejnění nové `docs/privacy.html`
a před odesláním buildu s klíčem `TELEMETRY_KEY`.** Odpovídají
`ios/Runner/PrivacyInfo.xcprivacy`. Před vyplněním ověř aktuální znění
formulářů a porovnej s tím, co je v konzolích vyplněné dnes (appka zatím
v obchodě není, plán počítal s „nesbírá data“).

Statistiky přijímá a ukládá vývojář na vlastním serveru v EU (Česko). Žádná
třetí strana je nedostane, takže jde o *sbírané*, ne *sdílené* údaje. IP se
neukládá, server uloží jen zemi. Uchování 12 měsíců. Jdou vypnout v
nastavení appky (ozubené kolo v záložce „Co uvařím“).

## App Store Connect → App Privacy

**Privacy Policy URL:** GitHub Pages `privacy.html`, beze změny adresy.

**Do you or your third-party partners collect data from this app?** **Yes.**

| Kategorie → typ | Linked to the user? | Used for tracking? | Purpose |
|---|---|---|---|
| Usage Data → **Product Interaction** | **No** | **No** | **Analytics** |
| Diagnostics → **Performance Data** | **No** | **No** | **Analytics** |
| Location → **Coarse Location** | **No** | **No** | **Analytics** |

Proč:

- *Product Interaction*: spuštění, obrazovky a čas na nich, otevřené recepty
  (jen počet chybějících surovin a zdarma ano/ne), režim vaření, počty ve
  spíži a nákupním seznamu, nákupy balíčků (výsledek), použité funkce.
- *Performance Data*: doba startu v milisekundách (`app_ready`).
- *Coarse Location*: příjemce zjistí zemi z IP adresy spojení, uloží jen
  zemi a IP neukládá. Kdyby se ukládání země na příjemci vypnulo, tenhle
  řádek odškrtni a smaž `NSPrivacyCollectedDataTypeCoarseLocation` z
  `PrivacyInfo.xcprivacy`.

Nesbírá se (nechat nezaškrtnuté): Contact Info, Health & Fitness, Financial
Info, Precise Location, Sensitive Info, Contacts, **User Content** (spíž,
nákupní seznam ani hledaný text appku neopustí), Browsing History, **Search
History** (posílá se jen to, že hledání nic nenašlo, ne co se hledalo),
Identifiers (žádné User ID ani Device ID: ID relace je náhodné, jen v paměti
a nikdy se znovu nepoužije), Purchases (nákupy jsou data Apple; statistika
nese jen výsledek, ne produkt ani cenu), Other Usage Data, Crash Data, Other
Diagnostic Data, Other Data.

**Linked to the user: No** u všech typů: žádný účet, žádný identifikátor,
dvě relace nejde spojit.

**Tracking: No.** Nic se nekombinuje s daty jiných firem, žádná reklama,
`NSPrivacyTracking` je `false`, není potřeba výzva App Tracking Transparency.

## Google Play Console → Data safety

- Does your app collect or share any of the required user data types? **Yes.**
- Is all of the user data collected by your app encrypted in transit? **Yes**
  (HTTPS; klient adresu bez `https` odmítne).
- Do you provide a way for users to request that their data is deleted?
  **No.** Appka nemá účet a statistiky nenesou identifikátor, takže k člověku
  nejde žádný záznam najít. Vypínač v nastavení smaže neodeslané záznamy v
  zařízení, na serveru se mažou po 12 měsících.
- Datové typy, všechny **Collected**, **not shared**:

| Data type | Purpose | Ephemeral? | Required or optional |
|---|---|---|---|
| App activity → **App interactions** | **Analytics** | No | **Optional** (vypínač „Anonymní statistiky“) |
| App info and performance → **Diagnostics** | **Analytics** | No | **Optional** (týž vypínač; doba startu) |
| Location → **Approximate location** | **Analytics** | No | **Optional** (týž vypínač; země z IP, IP se neukládá) |

Kdyby se ukládání země na příjemci vypnulo, řádek *Approximate location*
vypusť.

Nesbírá se: přesná poloha, osobní údaje, finanční údaje (nákupy jsou data
Google Play Billing), App activity → Other user-generated content / In-app
search history, ID zařízení ani jiná ID, kontakty, soubory, zprávy, historie
prohlížení.

Nákupy přes Google Play Billing: Google je zpracovává jako svá data, appka se
dozví jen, který balíček byl koupen; v Data safety se za appku neuvádějí.

## Mimo repo, změnit před zapnutím

1. App Store Connect → App Privacy: tabulka výše.
2. Google Play Console → Data safety: tabulka výše.
3. Stránka appky na olin.now (všechny jazyky), pokud tvrdí, že appka nic
   nesbírá nebo neposílá.
