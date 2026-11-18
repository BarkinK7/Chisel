# Chisel

Carve your best self. A habit and goal app where Chip, a little marble mascot, climbs from Merchant to God as you finish tasks, keep streaks and reach big goals with friends.

- `www/index.html` is the whole app. `www/cloud.js` holds the friends database address.
- `supabase-setup.sql` creates the friends database (run it once in Supabase).
- `android-res/` holds the Chip app icon at every Android size, and the white Chip icon for notifications.

## Builds

- Every push to `main` builds an APK: **Actions** tab > latest run > **Chisel-apk**.
- Every published **Release** (for example `v1.1`) builds an APK and attaches it to that release, so each version stays downloadable.
- Builds are signed with the key in the `CHISEL_KEYSTORE` secret, so a new version installs over the old one and keeps your data. Keep a copy of that key somewhere safe.
- The version shown on the phone comes from `"version"` in `package.json`. Raise it before each release.
- Name each release tag `v` + the version, like `v1.2` or `v1.3`. From 1.2 on, the app checks the latest release and shows an **Update** card when a newer one exists.

## What's in 1.2

- Two currencies: Drachma (earned by doing, buys most items) and Ambrosia (rare, buys Streak Freezes, Pardons and the Ambrosia collection of special items). Old coin balances were recalculated; bought items stay.
- New ranks offer several rewards to choose from. Halos come only from ranks; bought halos were refunded.
- Learn-by-doing onboarding, a "first week" path with 7 gifts, a daily pace and weekly pace suggestions.
- Streak Freeze (covers a missed day) and Pardon (clears a missed task's penalty). Undo now takes back every reward an action gave.
- Friend requests with accept and decline, friend and invite rewards, your own profile card, league banners on profiles.
- Up to three varied reminders a day with a white Chip status icon, and an in-app update card.
- Goal steps show up in the day's task list. Calmer typography with embedded Nunito and Fredoka fonts, a lower tab bar and a new add button.
- 1.2.1: the Ambrosia collection (Galaxy, Molten gold, Frost crystal, Phoenix wings, Golden aura, Crown of stars, Apollo's flame, Aurora), Freeze and Pardon paid in Ambrosia, tap your profile header to see your card, goal steps always on Home, the add button back in the app's style, original font weights with lighter counters.
- 1.2.2: nothing overlaps on Chip any more. Held items stay in front of hair and hats, neck pieces sit under beards, the mouth shows over mustaches, and every hat that sits on the crown tucks tall hair in.
- New items: 7 hairstyles, 4 beards, 5 hats, 5 extras, 3 eyes, 3 mouths, 3 colors, 2 hair colors. Hats no longer clash with tall hair.
