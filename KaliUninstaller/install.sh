#!/bin/sh
# KALI UNINSTALLER v2.2 — installer
set -e

APP_ID="kali-uninstaller"
APP_DIR="/opt/kali-uninstaller"
SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

echo "=============================================="
echo "   KALI UNINSTALLER v2.2 — INSTALLER"
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
mkdir -p "$APP_DIR/assets"
install -m 755 "$SCRIPT_DIR/kali_uninstaller.py" "$APP_DIR/kali_uninstaller.py"

# Install and verify the uninstaller explicitly; never report success if it is absent.
install -m 755 "$SCRIPT_DIR/uninstall_me.sh" "$APP_DIR/uninstall_me.sh"
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
        install -m 644 "$SCRIPT_DIR/assets/$asset" "$APP_DIR/assets/$asset"
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
