# ❄ Kali Uninstaller v4.3 — Whiteout Edition

**“Born in the snow, built for the hunt.”**

A graphical Kali Linux tool manager that detects installed tools from multiple package sources and helps remove selected applications, packages, and their related leftovers.

## Features

- Detects tools from APT/dpkg, desktop launchers, pip, pipx, npm, Ruby gems, Cargo, Go, Flatpak, Snap, AppImages, GitHub clones, and common custom binary locations.
- Fast initial results with additional sources scanned in parallel.
- Bounded command timeouts and scan deadlines to avoid endless loading.
- Optional full removal of related configuration files, caches, and launchers.
- Safety checks for essential packages and dpkg-owned system files.

## Requirements

- Kali Linux (or a compatible Debian-based system)
- Python 3
- Tkinter

The installer checks for Tkinter and installs `python3-tk` if it is missing. SVG icon conversion support is optional; the installer attempts to install `librsvg2-bin` when no supported converter is present.

## Download

```bash
git clone https://github.com/arcticfox-cyber/Kali-Uninstaller.git
cd Kali-Uninstaller/KaliUninstaller
```

## Run without installing

From the `KaliUninstaller` directory:

```bash
chmod +x run.sh
./run.sh
```

If Tkinter is missing:

```bash
sudo apt update
sudo apt install -y python3-tk
```

You can also start the application directly:

```bash
sudo python3 kali_uninstaller.py
```

## Install system-wide (recommended)

Run these commands from the `KaliUninstaller` directory:

```bash
chmod +x install.sh
sudo bash install.sh
```

The installer places the application in `/opt/kali-uninstaller`, creates the `kali-uninstaller` command, and adds a desktop menu entry.

Launch:

```bash
kali-uninstaller
```

Or open **Kali Uninstaller** from your desktop application menu.

## Diagnostics

```bash
kali-uninstaller --doctor
```

## Uninstall

After system-wide installation:

```bash
sudo sh /opt/kali-uninstaller/uninstall_me.sh
```

To run the uninstaller directly from the downloaded source directory:

```bash
sudo sh uninstall_me.sh
```

## Project structure

```text
Kali-Uninstaller/
├── LICENSE
├── README.md
├── logo.png
└── KaliUninstaller/
    ├── README.md
    ├── install.sh
    ├── run.sh
    ├── uninstall_me.sh
    ├── kali_uninstaller.py
    └── assets/
        ├── logo.png
        ├── logo_small.png
        └── splash.png
```

## Safety notes

- Review selected items before confirming removal.
- Essential/critical package protections are built in.
- The application checks package ownership before deleting system files.
- It avoids unrestricted, blind `apt autoremove`; dependency cleanup is targeted.

## License

See [LICENSE](../LICENSE).
