#!/bin/sh
# KALI UNINSTALLER — bina install foran chalao:   ./run.sh
set -e
SCRIPT_DIR=$(cd -- "$(dirname -- "$0")" && pwd)
cd "$SCRIPT_DIR"

if ! python3 -c "import tkinter" 2>/dev/null; then
    echo "[X] GUI library (tkinter) missing hai. Ye command chalao:"
    echo "    sudo apt update && sudo apt install -y python3-tk"
    exit 1
fi

echo "[*] Kali Uninstaller khul raha hai (root ke liye password prompt aa sakta hai)..."
exec python3 ./kali_uninstaller.py "$@"
