#!/bin/sh
# =====================================================================
#  KALI UNINSTALLER v2.2  —  installer
#  Chalane ka tareeqa:   sudo ./install.sh
#  (ya:  sudo bash install.sh  /  sudo sh install.sh — sab chalega)
# =====================================================================
set -e

APP_ID="kali-uninstaller"
APP_DIR="/opt/kali-uninstaller"
SCRIPT_DIR=$(cd -- "$(dirname -- "$0")" && pwd)

echo "=============================================="
echo "   KALI UNINSTALLER v2.2  —  INSTALLER"
echo "=============================================="

# ---------- root permission ----------
if [ "$(id -u)" -ne 0 ]; then
    echo "[*] Root permission chahiye — sudo se dobara chal raha hoon..."
    exec sudo -E sh "$0" "$@"
fi

# ---------- Kali check (sirf warning) ----------
if [ -r /etc/os-release ] && grep -qE '^ID=["]?kali["]?$' /etc/os-release 2>/dev/null; then
    echo "[OK] Kali Linux detected."
else
    echo "[!] Note: Kali detect nahi hua — kisi bhi Debian-based system par chalega."
fi

# ---------- required files ----------
for f in kali_uninstaller.py uninstall_me.sh assets/logo.png; do
    if [ ! -f "$SCRIPT_DIR/$f" ]; then
        echo "[X] Missing file: $f — poora folder extract karo (zip ka jawab: unzip KaliUninstaller-v2.2.zip)." >&2
        exit 1
    fi
done

# ---------- dependencies (sirf python3-tk) ----------
echo "[*] Dependencies check ho rahi hain..."
if python3 -c "import tkinter" 2>/dev/null; then
    echo "[OK] tkinter (GUI) pehle se maujood hai."
else
    echo "[*] python3-tk install ho rahi hai (chand second lagenge)..."
    apt-get update -qq || true
    apt-get install -y --no-install-recommends python3-tk
fi

# ---------- purana Arctic Fox cleanup (agar installed tha) ----------
if [ -n "${SUDO_USER:-}" ]; then
    UH=$(getent passwd "$SUDO_USER" 2>/dev/null | cut -d: -f6)
    if [ -n "$UH" ]; then
        rm -rf "$UH/.local/lib/arctic-fox-uninstaller" 2>/dev/null || true
        rm -f "$UH/.local/share/applications/arctic-fox-uninstaller.desktop" 2>/dev/null || true
        rm -f "$UH/.local/bin/arctic-fox-uninstaller-root-launch" 2>/dev/null || true
        rm -f "$UH/.local/bin/arctic-fox-uninstaller-uninstall" 2>/dev/null || true
    fi
fi

# ---------- install files ----------
echo "[*] Files copy ho rahi hain -> $APP_DIR"
rm -rf "$APP_DIR"
mkdir -p "$APP_DIR/assets"
install -m 755 "$SCRIPT_DIR/kali_uninstaller.py" "$APP_DIR/kali_uninstaller.py"
install -m 755 "$SCRIPT_DIR/uninstall_me.sh" "$APP_DIR/uninstall_me.sh"
[ -f "$SCRIPT_DIR/assets/logo.png" ]        && install -m 644 "$SCRIPT_DIR/assets/logo.png"        "$APP_DIR/assets/logo.png"        || true
[ -f "$SCRIPT_DIR/assets/logo_small.png" ]  && install -m 644 "$SCRIPT_DIR/assets/logo_small.png"  "$APP_DIR/assets/logo_small.png"  || true
[ -f "$SCRIPT_DIR/assets/splash.png" ]      && install -m 644 "$SCRIPT_DIR/assets/splash.png"      "$APP_DIR/assets/splash.png"      || true

# ---------- terminal command ----------
echo "[*] Command ban rahi hai: /usr/bin/$APP_ID"
cat > "/usr/bin/$APP_ID" <<'EOF'
#!/bin/sh
# Kali Uninstaller launcher — tool hamesha ROOT mode me khulta hai
# (app khud pkexec/sudo se elevate hoti hai).
export DISPLAY="${DISPLAY:-:0}"
exec /usr/bin/python3 /opt/kali-uninstaller/kali_uninstaller.py "$@"
EOF
chmod 755 "/usr/bin/$APP_ID"

# ---------- applications menu entry ----------
echo "[*] Applications menu entry ban rahi hai..."
cat > "/usr/share/applications/$APP_ID.desktop" <<EOF
[Desktop Entry]
Version=2.2
Type=Application
Name=Kali Uninstaller
GenericName=Package Uninstaller
Comment=Fast, root-powered package remover for Kali Linux
Exec=/usr/bin/$APP_ID
Path=$APP_DIR
Icon=$APP_DIR/assets/logo.png
Terminal=false
StartupNotify=true
StartupWMClass=$APP_ID
Categories=System;PackageManager;Utility;
Keywords=Uninstaller;Remove;Purge;APT;Root;Kali;
EOF
chmod 644 "/usr/share/applications/$APP_ID.desktop"
command -v update-desktop-database >/dev/null 2>&1 && update-desktop-database /usr/share/applications >/dev/null 2>&1 || true

# ---------- self-check ----------
echo
echo "=== SELF-CHECK (doctor) ==="
python3 "$APP_DIR/kali_uninstaller.py" --doctor || true

echo
echo "=============================================="
echo "   INSTALL COMPLETE!"
echo "=============================================="
echo "  Terminal se kholne ke liye:    kali-uninstaller"
echo "  Ya menu se: Applications -> System -> Kali Uninstaller"
echo "  Koi masla ho to:               kali-uninstaller --doctor"
echo "  Tool hatane ke liye:           sudo $APP_DIR/uninstall_me.sh"
echo "=============================================="
