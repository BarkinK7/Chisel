# Chisel

Carve your best self. A habit and goal app where Chip, a little marble mascot, climbs from Merchant to God as you finish tasks, keep streaks and reach big goals with friends.

- `www/index.html` is the whole app. `www/cloud.js` holds the friends database address.
- `supabase-setup.sql` creates the friends database (run it once in Supabase).
- `android-res/` holds the Chip app icon at every Android size.

## Builds

- Every push to `main` builds an APK: **Actions** tab > latest run > **Chisel-apk**.
- Every published **Release** (for example `v1.1`) builds an APK and attaches it to that release, so each version stays downloadable.
- Builds are signed with the key in the `CHISEL_KEYSTORE` secret, so a new version installs over the old one and keeps your data. Keep a copy of that key somewhere safe.
- The version shown on the phone comes from `"version"` in `package.json`. Raise it before each release.
