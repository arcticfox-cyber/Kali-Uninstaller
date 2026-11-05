# KALI UNINSTALLER v2.2

**Takatwar, fast, root-powered package remover — Kali Linux ke liye.**

Moonlit Fox Spirit theme ke saath kahtarnaak dark neon design.
Wallpaper, logo aur saare UI icons **file ke andar embedded** hain — sirf aik
dependency (`python3-tk`), koi Pillow nahi, koi missing asset nahi.

---

## v2.2 me naya (GUI + ICONS FIX)

- **REAL tool icons** — package list me har tool ka asli icon dikhta hai
  (`.desktop` files + `/usr/share/icons` theme + `/usr/share/pixmaps` se
  milta hai). Jo package ka icon system me nahi, uske liye pyara sa
  violet cube glyph; CRITICAL packages ke liye red warning glyph.
- **Stats bar** — PACKAGES / CRITICAL / TOOL ICONS / TOTAL SIZE chips + REFRESH button
- **Filter chips** — ALL / CRITICAL / > 100 MB ek click me
- **Sortable columns** — PACKAGE / VERSION / SIZE heading par click karo
  (SIZE par pehla click = sab se bari file pehle)
- **Details panel** — 1 package select karo to uska bara icon, version,
  section, size aur description neeche dikhta hai; multiple select par
  total size ke saath summary
- **Right-click menu** — UNINSTALL, copy name/version, select all, refresh
- **Hover highlight** — mouse jis row par ho wo highlight hoti hai
- **Details dialog** — confirm box me ab packages count + total size + warn icon
- **Keyboard** — Ctrl+F search, Ctrl+A select all, F5 / Ctrl+R refresh

## Features (pehle se)

- **4 second splash screen** — Fox Spirit Kali wallpaper, phir tool khulta hai
- **Direct ROOT mode** — tool khud pkexec/sudo se elevate hota hai
- **Sirf AIK option: UNINSTALL** — purge + autoremove, koi faltu option nahi
- **Fast search** — packages ek hi `dpkg-query` call se load, search instant
- **CRITICAL packages red** — apt, dpkg, libc6, systemd, grub waghera red me
- **Operation log** — uninstall ka poora output live dikhta hai
- **Danger confirm dialog** — galti se kuch delete nahi hoga
- **`--doctor` check** — koi masla ho to khud bata deta hai

---

## Install (Kali Linux)

```bash
cd KaliUninstaller
chmod +x install.sh
sudo ./install.sh
```

> `sudo bash install.sh` ya `sudo sh install.sh` — dono chalte hain.
> Installer khud `python3-tk` install kar lega aur aakhir me self-check
> karega.

## Tool kholne ka tareeqa

**Terminal se (sab se aasan):**

```bash
kali-uninstaller
```

**Ya menu se:** `Applications -> System -> Kali Uninstaller`

**Bina install foran chalana:**

```bash
./run.sh
```

Pehli dafa password prompt aayega (root ke liye) — uske baad tool hamesha
**full root authority** ke saath khulta hai.

## Icons ka system kaise kaam karta hai?

Tool start hote waqt ek dafa ye scan karta hai (koi internet nahi chahiye):

1. `/usr/share/applications/*.desktop` — har tool ki desktop entry ka `Icon=`
2. `/usr/share/icons/<theme>/<size>/apps/` — hicolor + baaki themes
3. `/usr/share/pixmaps/` — classic icon location

Phir package ka naam in indexes se match hota hai (desktop file ka naam,
Exec binary, ya Name field). Match mila to **asli icon** list me dikhta hai;
nahi mila to fallback glyph (violet cube, critical par red warning).
Stats bar ki **TOOL ICONS** chip batati hai ke kitne real icons mile.

## Koi masla ho to (tool khul nahi raha? / icons nahi dikh rahe?)

```bash
python3 kali_uninstaller.py --doctor
```

Ye batayega ke kya missing hai, aur icon sources (desktop files + system
icons kitni mili) bhi print karega.

## Use kaise karein

1. Tool kholo — 4 sec splash ke baad main page aayega
2. Search box me package ka naam likho (instant filtering), ya FILTER
   chips se CRITICAL / > 100 MB par jao
3. Package par **double-click** karo, select karke **UNINSTALL** dabao,
   ya **right-click menu** se uninstall karo
4. Confirm dialog me **YES, REMOVE** dabao — done!

## Warning

- Ye tool **root** ke saath chalta hai — power full hai, istemal soch
  samajh kar karo
- **Red** row wale packages critical hote hain (system break ho sakta hai)
- Uninstall = `apt-get remove --purge` + `apt-get autoremove --purge`

## Tool ko hatana

```bash
sudo /opt/kali-uninstaller/uninstall_me.sh
```
