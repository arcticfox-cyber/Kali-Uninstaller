# ❄ KALI UNINSTALLER v4.3 — WHITEOUT EDITION

**"Born in the snow, built for the hunt."**

Kali Linux ka total tool remover — install/uninstall kiye gaye HAR tool ko
dhoondta hai, dikhata hai, aur FULL delete karta hai (Revo Uninstaller style,
Kali ke liye).

## v4.3 WHITEOUT — INSTANT LOAD (10-minute hang ka permanent ilaaj)

Purani version me list tab tak khali rehti thi jab tak saare sources
(pipx/pip/npm/gem/snap/flatpak) ek-ek karke khatam na hon — koi ek slow/wedged
command ho to tool 10+ minute "loading" dikhata tha.

**Ab:**
1. **TURANT PAINT** — apt + .desktop apps ~1-3s me list me aa jati hain
   (chunk-1), phir baqi sources live aate hain
2. **PARALLEL SOURCES** — pipx/pip/npm/gem/files-bins ek saath (5 threads),
   koi ek slow ho to baaki rukte nahi
3. **HAR COMMAND ka tight timeout** — npm 20s, pip 30s, gem 20s, pipx 20s,
   snap/flatpak 8s, dpkg fallback 5s
4. **60s GLOBAL DEADLINE** — budget paar = source skip + report; list KABHI
   infinite loading me nahi phansegi (test me 120s-sleeping source bhi 10s
   me skip hua)
5. **LIVE LOAD STATUS** — `LOADING • 3s • 932 rows • pip:87 npm:5 ...` +
   progress bar — hamesha nazar aata hai ke kaam ho raha hai
6. **FULL DELETE upgrade** — purge ke baad jo orphan dependencies isi removal
   se bachi unhe targeted purge (critical-guard + cap 80; global blind
   autoremove KABHI nahi)

## v4.2 — FULL REMOVE (Revo-style)
- Uninstall confirm par FULL REMOVE checkbox (default ON) — uninstall ke
  baad leftovers (configs/caches/launchers) AUTOMATIC scan + delete
- Deep scan coverage: 27 roots, root budget 5s, deadline 60s

## v4.1 — DEEP SCAN SPEED ENGINE
- Parallel root scanning (6 threads) + live streaming results
- Per-root time budget + 45s deadline — scan hamesha khatam
- Size estimates capped (250 files / 0.6s) — HDD par bhi fast

## v4.0 — TOTAL DETECTION
- 14 sources: apt, .desktop launchers (system/local/flatpak/snap), pip
  (console-script tools), pipx, npm -g, ruby gems, cargo bins, go bins,
  /opt programs, /usr/local + ~/.local custom binaries, AppImages,
  GitHub clones, flatpak, snap — 300+ tools tak sab detect + searchable

## SAFETY (hamesha ON)
- dpkg-owned system files kabhi delete nahi hote (live dpkg-query check,
  fail-safe)
- Essential/critical packages par SAFETY STOP
- Custom tools ke files delete se pehle bhi live owner check
- Global blind autoremove kabhi nahi — sirf targeted, simulated purge

## RUN
```bash
sudo python3 kali_uninstaller.py
```

## INSTALL (optional)
```bash
cd KaliUninstaller
sudo bash install.sh        # /opt/kali-uninstaller + launcher
kali-uninstaller            # kisi bhi waqt
```

## TESTS (sab verified)
- Load: core 932 items 0.04s me paint, extras parallel streaming
- Hang-simulation: 120s-sleeping source bhi 10s me skip + finalize
- GUI smoke (Xvfb): first paint 0.14s, READY 0.6s, search OK
- FULL DELETE: auto-deps parse + targeted purge + critical guard PASS
- Deep scan: streaming/deadline/stop/compat PASS
