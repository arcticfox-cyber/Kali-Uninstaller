#!/bin/sh
# KALI UNINSTALLER v4.0 — installer
set -e

APP_ID="kali-uninstaller"
APP_DIR="/opt/kali-uninstaller"
SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

echo "=============================================="
echo "   KALI UNINSTALLER v4.0 — INSTALLER"
echo "=============================================="

if [ "$(id -u)" -ne 0 ]; then
    echo "[*] Root permission required — restarting with sudo..."
    exec sudo -E sh "$0" "$@"
fi

if [ -r /etc/os-release ] && grep -qE '^ID=["]?kali["]?$' /etc/os-release 2>/dev/null; then
    echo "[OK] Kali Linux detected."
else
    echo "[!] Kali not detected — continuing on this Debian-based system."
fi

for f in kali_uninstaller.py uninstall_me.sh assets/logo.png; do
    if [ ! -f "$SCRIPT_DIR/$f" ]; then
        echo "[X] Missing required file: $SCRIPT_DIR/$f" >&2
        exit 1
    fi
done

echo "[*] Checking dependencies..."
if python3 -c "import tkinter" 2>/dev/null; then
    echo "[OK] tkinter is available."
else
    echo "[*] Installing python3-tk..."
    apt-get update -qq || true
    apt-get install -y --no-install-recommends python3-tk
fi

# optional: SVG icon conversion (koi ek kaafi hai)
if ! command -v rsvg-convert >/dev/null 2>&1 \
        && ! command -v convert >/dev/null 2>&1 \
        && ! command -v inkscape >/dev/null 2>&1; then
    echo "[i] SVG icon converter nahi mila — optional librsvg2-bin install kar raha hoon..."
    apt-get install -y --no-install-recommends librsvg2-bin >/dev/null 2>&1 \
        && echo "[OK] librsvg2-bin installed (SVG icons ab banti hain)" \
        || echo "[!] optional — SVG-only icons pe fallback glyph dikhega"
else
    echo "[OK] SVG icon converter available."
fi

if [ -n "${SUDO_USER:-}" ]; then
    UH=$(getent passwd "$SUDO_USER" 2>/dev/null | cut -d: -f6)
    if [ -n "$UH" ]; then
        rm -rf "$UH/.local/lib/arctic-fox-uninstaller" 2>/dev/null || true
        rm -f "$UH/.local/share/applications/arctic-fox-uninstaller.desktop" 2>/dev/null || true
        rm -f "$UH/.local/bin/arctic-fox-uninstaller-root-launch" 2>/dev/null || true
        rm -f "$UH/.local/bin/arctic-fox-uninstaller-uninstall" 2>/dev/null || true
    fi
fi

echo "[*] Installing files into $APP_DIR..."
# The GUI runs with root privileges: never trust a user-writable install path.
if [ -L "$APP_DIR" ] || { [ -e "$APP_DIR" ] && [ ! -d "$APP_DIR" ]; }; then
    echo "[X] Unsafe install path: $APP_DIR (must be a real directory, not a symlink)." >&2
    exit 1
fi
mkdir -p "$APP_DIR/assets"
if [ -L "$APP_DIR/assets" ]; then
    echo "[X] Unsafe assets path: $APP_DIR/assets (symlinks are not accepted)." >&2
    exit 1
fi
chown root:root "$APP_DIR" "$APP_DIR/assets"
chmod 755 "$APP_DIR" "$APP_DIR/assets"

# Replace destination links/files rather than following an old symlink.
rm -f "$APP_DIR/kali_uninstaller.py" "$APP_DIR/uninstall_me.sh"
install -o root -g root -m 755 "$SCRIPT_DIR/kali_uninstaller.py" "$APP_DIR/kali_uninstaller.py"

# Install and verify the uninstaller explicitly; never report success if it is absent.
install -o root -g root -m 755 "$SCRIPT_DIR/uninstall_me.sh" "$APP_DIR/uninstall_me.sh"
if [ ! -s "$APP_DIR/uninstall_me.sh" ]; then
    echo "[!] install utility did not create the uninstaller; retrying with cp..." >&2
    cp "$SCRIPT_DIR/uninstall_me.sh" "$APP_DIR/uninstall_me.sh"
    chmod 755 "$APP_DIR/uninstall_me.sh"
fi
if [ ! -s "$APP_DIR/uninstall_me.sh" ] || [ ! -x "$APP_DIR/uninstall_me.sh" ]; then
    echo "[X] Uninstaller installation failed. Check $APP_DIR/uninstall_me.sh" >&2
    exit 1
fi
echo "[OK] Uninstaller installed and verified: $APP_DIR/uninstall_me.sh"

for asset in logo.png logo_small.png splash.png; do
    if [ -f "$SCRIPT_DIR/assets/$asset" ]; then
        rm -f "$APP_DIR/assets/$asset"
        install -o root -g root -m 644 "$SCRIPT_DIR/assets/$asset" "$APP_DIR/assets/$asset"
    fi
done

echo "[*] Creating /usr/bin/$APP_ID..."
cat > "/usr/bin/$APP_ID" <<'EOF'
#!/bin/sh
exec /usr/bin/python3 /opt/kali-uninstaller/kali_uninstaller.py "$@"
EOF
chmod 755 "/usr/bin/$APP_ID"

echo "[*] Creating desktop menu entry..."
cat > "/usr/share/applications/$APP_ID.desktop" <<EOF
[Desktop Entry]
Version=4.0
Type=Application
Name=Kali Uninstaller
GenericName=Package Uninstaller
Comment=Total detection: apt + pip + npm + gem + AppImages + GitHub tools, real icons, deep scan
Exec=/usr/bin/$APP_ID
Path=$APP_DIR
Icon=$APP_DIR/assets/logo.png
Terminal=false
StartupNotify=true
StartupWMClass=$APP_ID
Categories=System;PackageManager;Utility;
Keywords=Uninstaller;Remove;Purge;APT;Root;Kali;Flatpak;Snap;Custom;
EOF
chmod 644 "/usr/share/applications/$APP_ID.desktop"
command -v update-desktop-database >/dev/null 2>&1 && update-desktop-database /usr/share/applications >/dev/null 2>&1 || true

echo
echo "=== SELF-CHECK (doctor) ==="
python3 "$APP_DIR/kali_uninstaller.py" --doctor

echo
echo "=============================================="
echo "   INSTALL COMPLETE!"
echo "=============================================="
echo "  Launch:                 kali-uninstaller"
echo "  Diagnostics:            kali-uninstaller --doctor"
echo "  Uninstall:              sudo sh $APP_DIR/uninstall_me.sh"
echo "  Verified uninstaller:   $APP_DIR/uninstall_me.sh"
echo "=============================================="
