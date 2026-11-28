# Anonymous usage statistics

Papánek sends a small set of anonymous usage events through
[`ol1n_telemetry`](https://github.com/lioilsources/Ol1nTelemetry), so the
developer can see what new cooks do after the first launch, where they give
up, and which parts of the app nobody uses. This file is the **event
dictionary**: the constant `papanekDictionary`
(`app/lib/telemetry/telemetry_dictionary.dart`) and this document list exactly
the same events and properties, and `app/test/telemetry_test.dart` fails when
they drift apart.

Adding an event or a property is a change to the privacy policy
(`docs/privacy.html`) and to the store privacy answers. Ask the owner first.

## Rules

The rules of `ol1n_telemetry` apply unchanged (see its README):

- **No persistent identifier.** No install, device or advertising id. Each
  session has a random id that lives only in memory.
- **Cohorts are computed on the device.** Only bands leave it.
- **Only enums, bands and numbers.** Nothing the user types or chooses as
  content leaves the device: no ingredient, no recipe, no search text, no
  pantry or shopping list contents. Only counts (how many items) and yes/no.
- **No key, no network.** Without `TELEMETRY_KEY` and an `https`
  `TELEMETRY_HOST` in the build nothing is recorded or sent, and the settings
  button (the switch is its only content) is hidden.
- **The app never waits**; failures are swallowed. Offline queue of at most
  500 events.
- **Off means off, at once.** The switch in Settings wipes the queue.
- **Measuring never steers the app.** No app code reads anything the client
  holds. `AppState.hadData` exists only for `hadDataBefore`.

Events go to the developer's own collector (StoreMetrics, protocol v1, app id
`papanek`); no third party receives them. The collector stores the country
from Cloudflare's header and never stores the IP address. Raw events are kept
12 months.

## Configuration

| `--dart-define` | Meaning |
|---|---|
| `TELEMETRY_KEY` | The app's key at the collector. Empty → nothing is sent. |
| `TELEMETRY_HOST` | The collector's address, `https`. Empty → nothing is sent. |
| `TELEMETRY_DEBUG` | `true` prints events to the console instead of sending them. |

`release-android.yml` and `release-ios.yml` pass both from the GitHub secrets
of the same names; the tag step rewrites `kAppVersion` together with
`pubspec.yaml`. Builds that are not release builds report `tester: true`.

## Screens

The tab bar has no routes, so its tabs report themselves
(`Telemetry.screen`); pushed pages carry route names and are reported by
`PapanekNavigatorObserver`, which maps `/` to the current tab.

| Screen | What it is |
|---|---|
| `cook` | tab "Cook": recipes grouped by missing ingredients (home) |
| `pantry` | tab "Pantry": search and the list of what is at home |
| `shopping` | tab "Shopping": the shopping checklist |
| `shop` | the pack shop, as a tab (only when a paid pack has recipes) or opened from a locked recipe |
| `recipe` | recipe detail |
| `cooking` | cooking mode, step by step |
| `settings` | settings (the statistics switch) |

## Activation

The first **finished cooking mode** (the last step's "Done", `cook_end` with
`result: ok`): the beginner actually cooked something with the app.

## Features

For `feature_use` and `feature_snapshot`: do advanced users use them?

| Feature | When |
|---|---|
| `pantry` | an ingredient added to the pantry |
| `shopping_list` | missing ingredients added to the shopping list |
| `checkout` | "Bought" moved checked items to the pantry |
| `cooking_mode` | cooking mode opened |
| `step_timer` | a step timer started |
| `servings` | servings changed on a recipe |
| `recipe_lang` | recipe language switched (CZ/EN) |
| `pantry_deduct` | used ingredients removed from the pantry after cooking |

## Common properties

Sent with every event.

| Property | Type | Values |
|---|---|---|
| `app_version` | enum | the app version (`kAppVersion`, checked against `pubspec.yaml`) |
| `platform` | enum | `ios`, `android`, `macos`, `windows`, `linux`, `other` |
| `lang` | enum | the UI language, one of the 47 ARB locales: `ar`, `bn`, `ca`, `cs`, `da`, `de`, `el`, `en`, `es`, `fi`, `fr`, `gu`, `he`, `hi`, `hr`, `hu`, `id`, `it`, `ja`, `kn`, `ko`, `ml`, `mr`, `ms`, `nb`, `nl`, `or`, `pa`, `pl`, `pt`, `pt_BR`, `pt_PT`, `ro`, `ru`, `sk`, `sl`, `sv`, `ta`, `te`, `th`, `tr`, `uk`, `ur`, `vi`, `zh`, `zh_Hans`, `zh_Hant` |
| `session_band` | band | session number: `1`, `2`, `3-5`, `6-10`, `11+` |
| `days_band` | band | days since measuring began: `0`, `1`, `2-6`, `7-29`, `30+`, `pre` |
| `first_session` | bool | the very first session of a new install |
| `tester` | bool | tester build (not a release build) or tester device |
| `recipe_lang` | enum | the language recipes are shown in: `cs`, `en` |

## Events

Core events come from `ol1n_telemetry`; the question each app event answers
refers to plan §1 (`DevConventions/Prompts/04-PLAN-analytika.md`).

### `app_open`

Cold start, or a new session after more than 30 minutes in the background.
Question: does a new user come back (2nd, 3rd, 6th, 11th session; day 1, 2,
7, 30)?

| Property | Type | Values |
|---|---|---|
| `start` | enum | `cold`, `resume` |
| `session_band_first` | bool | the first session of this install in its `session_band` |
| `days_band_first` | bool | the first session of this install in its `days_band` |
| `campaign` | campaign | optional; QR campaign of a new install, `^[a-z0-9-]{1,24}$` (not sent by Papánek yet) |

### `screen_view`

A screen appeared. Question: what does a new user do after the first launch?

| Property | Type | Values |
|---|---|---|
| `screen` | enum | `cook`, `pantry`, `shopping`, `shop`, `recipe`, `cooking`, `settings`, `other` |
| `prev` | enum | the previous screen, or `none` |

### `screen_leave`

A screen was left. Question: how long on which screen, and where is a long
stay without any action?

| Property | Type | Values |
|---|---|---|
| `screen` | enum | as in `screen_view` |
| `secs` | int | foreground seconds on the screen |
| `actions` | int | app events, feature uses and locked taps during the stay |

### `session_pause`

The app went to the background or is closing. Sent at once. Question: when
and where do people stop?

| Property | Type | Values |
|---|---|---|
| `active_secs` | int | foreground seconds in this session |
| `screen` | enum | the screen at the time, or `none` |
| `screen_secs` | int | foreground seconds on that screen |

### `activation`

The first finished cooking mode on this install. Once per install. Question:
how many new users get to cook something, and how fast?

| Property | Type | Values |
|---|---|---|
| `secs` | int | seconds since this session's `app_open` |

### `feature_use`

The first use of a feature in a session. Question: what do advanced users use?

| Property | Type | Values |
|---|---|---|
| `feature` | enum | `pantry`, `shopping_list`, `checkout`, `cooking_mode`, `step_timer`, `servings`, `recipe_lang`, `pantry_deduct` |

### `feature_snapshot`

After `app_open` of the 3rd, 6th and 11th session: which features this
install has ever used. Question: what do advanced users never use?

| Property | Type | Values |
|---|---|---|
| `f_pantry` | bool | pantry used |
| `f_shopping_list` | bool | shopping list filled from a recipe |
| `f_checkout` | bool | "Bought" used |
| `f_cooking_mode` | bool | cooking mode used |
| `f_step_timer` | bool | a step timer used |
| `f_servings` | bool | servings changed |
| `f_recipe_lang` | bool | recipe language switched |
| `f_pantry_deduct` | bool | used ingredients removed after cooking |
| `features_used` | int | how many of them |

### `error_shown`

The user saw an error. Question: where do advanced users struggle?

| Property | Type | Values |
|---|---|---|
| `kind` | enum | `store_unavailable` (the shop came into view saying the store is unavailable), `purchase` (a purchase failed) |
| `screen` | enum | the screen at the time, or `none` |

### `locked_tap`

A tap on something locked. Question: how often do people hit a paid pack?

| Property | Type | Values |
|---|---|---|
| `target` | enum | `recipe` (a locked recipe card), `unlock` (the "Unlock" button on a locked recipe) |

### `app_ready`

Once per cold start: the app state is loaded and the first screen can show.
Question: how long does the start take, especially the first one (it copies
the recipe database out of the app), and does a slow start lose new users?

| Property | Type | Values |
|---|---|---|
| `ms` | int | milliseconds from `main` to the loaded state |

### `recipe_open`

A recipe card was opened from the cook list. Question: what does a new user
do first, and do people open recipes they can cook now or ones they would
have to shop for?

| Property | Type | Values |
|---|---|---|
| `missing` | int | how many required ingredients are missing (0 = can cook now) |
| `free` | bool | the recipe is in the free pack |

### `cook_start`

Cooking mode opened. Question: where do cooks give up (with `cook_end`)?

| Property | Type | Values |
|---|---|---|
| `steps` | int | number of steps of the recipe |

### `cook_end`

Cooking mode left: finished with "Done" (`ok`), left early (`cancel`), or the
app went to the background and never came back (`background`). Question:
how many cooks finish, how long it takes, and at which step they give up.

| Property | Type | Values |
|---|---|---|
| `result` | enum | `ok`, `cancel`, `error`, `background` |
| `secs` | int | foreground seconds |
| `step` | int | the step shown last (1-based) |
| `timers` | int | step timers started |

### `pantry_add`

An ingredient was added to the pantry. Question: does a new user fill the
pantry, and how far?

| Property | Type | Values |
|---|---|---|
| `items` | int | number of ingredients in the pantry after the add |

### `pantry_search_miss`

The pantry search was submitted and found nothing. Only the fact is sent,
never the text. Question: where do users struggle (missing ingredients or
aliases)?

| Property | Type | Values |
|---|---|---|

### `shopping_add`

Missing ingredients of a recipe were added to the shopping list. Question: is
the recipe → shopping path used?

| Property | Type | Values |
|---|---|---|
| `items` | int | how many were added |

### `shopping_checkout`

"Bought": checked items moved to the pantry. Question: is the shopping list
used to the end?

| Property | Type | Values |
|---|---|---|
| `items` | int | how many items moved |

### `purchase_start`

A pack purchase began (the store sheet opens). Question: how many purchases
start, and from which offer?

| Property | Type | Values |
|---|---|---|
| `target` | enum | `all` (all packs), `pack` (one pack) |

### `purchase_end`

The purchase ended. Question: how many purchases fail or are cancelled, and
how long they take?

| Property | Type | Values |
|---|---|---|
| `result` | enum | `ok`, `cancel`, `error`, `background`, `restored` (the store reported an earlier purchase instead) |
| `secs` | int | foreground seconds |

## Reading the data

`store-metrics report papanek [--since 7d]` on the collector host. Tester
builds are left out by default.
