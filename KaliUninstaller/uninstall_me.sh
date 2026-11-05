#!/bin/sh
# Kali Uninstaller ko system se hatane ke liye:  sudo ./uninstall_me.sh
set -e
if [ "$(id -u)" -ne 0 ]; then
    exec sudo -E sh "$0" "$@"
fi
rm -rf /opt/kali-uninstaller
rm -f  /usr/bin/kali-uninstaller
rm -f  /usr/share/applications/kali-uninstaller.desktop
echo "Kali Uninstaller system se remove ho gaya."
