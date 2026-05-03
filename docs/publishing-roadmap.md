# Tower Drop — Publishing Roadmap

**Design source of truth:** [`game-design.md`](game-design.md) — v1 scope and product goals align with that doc.

Goal: move from a playable Godot prototype to a **store-ready** v1 you can maintain and iterate.

## 1. Define v1 scope (ship small)

- Single mode: endless tower, local high score, core hazards, three power-ups, difficulty ramp every 30 seconds.
- Defer: online multiplayer, skins shop, narrative, cloud saves (unless trivial with your backend).

## 2. Store and platform choice

| Platform   | Notes |
| ---------- | ----- |
| **Steam (PC)** | Steamworks SDK, depots, achievements optional for v1. |
| **itch.io** | Fastest path for a first public build; good for playtests. |
| **Google Play** | Android App Bundle, signing key custody, content rating questionnaire. |
| **Apple App Store** | Apple Developer Program, TestFlight, privacy nutrition labels. |

Pick **one primary** store for first launch to reduce certification overhead; mirror on itch.io for feedback.

## 3. Store assets checklist

- **Key art** and **screenshots** (required resolutions per store).
- **Short and long description**; tagline matching “fast arcade endless fall.”
- **Trailer** (15–60s): hook in first 3 seconds—crush + near-miss.
- **Icon** 512×512 (Android) and Apple icon set; adaptive icon layers for Android.

## 4. Legal and policy

- **Copyright:** Only use assets you licensed (fonts, music, SFX).
- **Privacy policy** URL if you use: analytics, ads, crash reporting, or online accounts.
- **Age rating** questionnaires honest and consistent with ads (if any).

## 5. Quality bar before submission

- No startup crashes on target devices; **graceful handling** of focus loss (mobile calls, alt-tab).
- **Tutorial:** none needed if first 5 seconds teach controls (or one non-blocking hint).
- **Localization:** optional for v1; English-only is acceptable if copy is minimal.

## 6. Post-launch (lightweight)

- Track retention informally (store console + optional privacy-friendly analytics).
- Patch cadence: balance from player clips; fix soft-locks in chunk rules first.

## 7. Optional monetization (decide before coding)

- **Premium:** one price, no ads—simplest alignment with arcade purity.
- **Ads + IAP:** more policy work; design around non-intrusive rewarded ads if you go this route.

Document the decision in your repo or design doc so implementation stays consistent.
