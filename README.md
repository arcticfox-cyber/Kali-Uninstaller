<div align="center">

<img src="logo.png" alt="Kali Uninstaller banner" width="100%" />

# KALI UNINSTALLER

**A graphical package management and removal utility for Kali Linux**

<p>
  <img src="https://img.shields.io/badge/Platform-Kali%20Linux-557C94?style=flat-square&logo=kalilinux&logoColor=white" alt="Kali Linux" />
  <img src="https://img.shields.io/badge/Language-Python%203-3776AB?style=flat-square&logo=python&logoColor=white" alt="Python 3" />
  <img src="https://img.shields.io/badge/Interface-Tkinter-2C3E50?style=flat-square" alt="Tkinter GUI" />
  <img src="https://img.shields.io/badge/License-Proprietary-red?style=flat-square" alt="Proprietary license" />
</p>

</div>

---

Kali Uninstaller provides a graphical way to browse installed packages, inspect package details, and remove selected software using APT. It is built for Kali Linux and may also run on other Debian-based distributions.

The application is located in the `KaliUninstaller/` directory. Follow the installation instructions below from that directory.

## Features

- Browse installed packages with package names, versions, sizes, and descriptions.
- Search packages and filter critical packages or packages larger than 100 MB.
- View package details and package statistics.
- Detect installed application icons from desktop entries and system icon locations.
- Sort package columns and use keyboard shortcuts and context menus.
- Review a confirmation dialog and view the operation log.
- Request elevated privileges when required.
- Run a diagnostic check with `--doctor`.

## Requirements

- Kali Linux (recommended), or another Debian-based Linux distribution.
- Python 3.
- APT and `dpkg`.
- Tkinter (`python3-tk`).

The installer checks for Tkinter and attempts to install `python3-tk` if it is missing.

## Installation

Clone the repository:

```bash
git clone https://github.com/arcticfox-cyber/Kali-Uninstaller.git
cd Kali-Uninstaller/KaliUninstaller
```

Make the installer executable and run it:

```bash
chmod +x install.sh
sudo ./install.sh
```

The installer places the application in `/opt/kali-uninstaller`, creates the `kali-uninstaller` terminal command, adds a desktop menu entry, and runs a diagnostic check.

## Launch

**From a terminal:**

```bash
kali-uninstaller
```

**From the desktop menu:**

```text
Applications → System → Kali Uninstaller
```

**Run directly without installing** (from the `KaliUninstaller/` directory):

```bash
chmod +x run.sh
./run.sh
```

## Diagnostics

If the application does not start or you encounter an issue, run:

```bash
python3 kali_uninstaller.py --doctor
```

After installation, you can also run:

```bash
kali-uninstaller --doctor
```

## Remove Kali Uninstaller

To remove the Kali Uninstaller application itself:

```bash
sudo /opt/kali-uninstaller/uninstall_me.sh
```

This removes the installed application, terminal command, and desktop menu entry. It does **not** restore packages previously removed by the tool.

## Repository layout

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

## Safety notice

Kali Uninstaller performs package-management operations with elevated privileges. Its removal process uses APT purge and autoremove operations. These can remove configuration files and dependencies, and removing essential packages may damage the operating system or make it unbootable.

Always review the selected packages and APT's proposed actions before confirming. Cancel the operation if an essential or unexpected package is listed. Keep backups of important data.

## License

Kali Uninstaller is proprietary software. All rights are reserved by the copyright holder. No permission is granted to use, copy, modify, distribute, or create derivative works without prior written permission, except where applicable law requires otherwise.

See the [LICENSE](LICENSE) file for the complete terms.

---

<div align="center">

**Developed by Arctic Fox**

</div>
