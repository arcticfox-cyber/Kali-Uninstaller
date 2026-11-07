<div align="center">

  <img src="logo.png" alt="Kali Uninstaller — Arctic Fox" width="220">

  <h1>KALI UNINSTALLER</h1>
  <h3>WHITEOUT EDITION · v4.3</h3>

  <p><strong>Find it. Review it. Remove it.</strong></p>
  <p>A multi-source graphical uninstaller for Kali Linux and compatible Debian-based systems.</p>

  <p>
    <a href="https://github.com/arcticfox-cyber/Kali-Uninstaller/stargazers"><img src="https://img.shields.io/github/stars/arcticfox-cyber/Kali-Uninstaller?style=for-the-badge&color=cyan" alt="GitHub stars"></a>
    <a href="https://github.com/arcticfox-cyber/Kali-Uninstaller/network/members"><img src="https://img.shields.io/github/forks/arcticfox-cyber/Kali-Uninstaller?style=for-the-badge" alt="GitHub forks"></a>
    <a href="https://github.com/arcticfox-cyber/Kali-Uninstaller/blob/main/LICENSE"><img src="https://img.shields.io/badge/license-proprietary-red?style=for-the-badge" alt="Proprietary license"></a>
    <a href="https://github.com/arcticfox-cyber/Kali-Uninstaller"><img src="https://img.shields.io/badge/platform-Kali%20Linux-blue?style=for-the-badge" alt="Kali Linux"></a>
  </p>

  <p><em>Born in the snow, built for the hunt.</em></p>

</div>

---

## Overview

**Kali Uninstaller** is a desktop application designed to help identify installed tools and applications across multiple package managers and common installation locations.

Instead of checking only APT packages, it scans a broad range of software sources, presents detected entries in a graphical interface, and provides removal workflows with safety checks.

> **Important:** This is a system-administration utility. Removing software can affect your operating system. Always review the selected entries and understand the removal action before confirming it.

## Features

| Capability | Description |
| --- | --- |
| Multi-source detection | Checks APT/dpkg, desktop launchers, pip, pipx, npm, Ruby gems, Cargo, Go, Flatpak, Snap, AppImages, GitHub clones and common custom locations. |
| Fast initial results | Core results can appear before slower discovery sources finish. |
| Parallel discovery | Additional sources are scanned concurrently. |
| Bounded scans | Command timeouts and scan deadlines help prevent indefinite loading. |
| Deep cleanup | Offers removal of related leftovers such as configuration files, caches and launchers. |
| Removal safeguards | Includes checks for essential packages and dpkg-owned system files. |
| Diagnostics | Provides a built-in doctor check after installation. |

## Compatibility

- Kali Linux
- Compatible Debian-based distributions
- Python 3
- Tkinter

The installer checks whether Tkinter is available and installs `python3-tk` when required. SVG icon conversion is optional; the installer attempts to provide `librsvg2-bin` if no supported converter is detected.

## Installation

### 1. Clone the repository

```bash
git clone https://github.com/arcticfox-cyber/Kali-Uninstaller.git
cd Kali-Uninstaller/KaliUninstaller
```

### 2. Install the application

```bash
chmod +x install.sh
sudo bash install.sh
```

The installer places the application under `/opt/kali-uninstaller`, creates the `kali-uninstaller` launcher, and adds an application-menu entry.

### 3. Launch

```bash
kali-uninstaller
```

You can also launch **Kali Uninstaller** from your desktop application menu.

## Run without installing

If you want to run it directly from the cloned source directory:

```bash
cd Kali-Uninstaller/KaliUninstaller
chmod +x run.sh
./run.sh
```

If Tkinter is missing, install it with:

```bash
sudo apt update
sudo apt install -y python3-tk
```

You can also start the Python application directly:

```bash
sudo python3 kali_uninstaller.py
```

## Diagnostics

After system-wide installation, run:

```bash
kali-uninstaller --doctor
```

This invokes the application's built-in diagnostic mode.

## Uninstallation

After installing system-wide, run:

```bash
sudo sh /opt/kali-uninstaller/uninstall_me.sh
```

To use the uninstaller script from the cloned source directory instead:

```bash
cd Kali-Uninstaller/KaliUninstaller
sudo sh uninstall_me.sh
```

## Repository structure

```text
Kali-Uninstaller/
├── logo.png
├── LICENSE
├── README.md
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

## Safety and responsible use

- Review every selected item before confirming removal.
- Do not remove packages or files unless you understand their purpose.
- Essential-package protections and package-ownership checks are part of the application's safeguards.
- The application avoids an unrestricted, blind `apt autoremove`; dependency cleanup is targeted.
- Keep backups of important data and system configuration before performing significant cleanup.
- Use this tool only on systems you own or are authorized to administer.

No automated safeguard can guarantee that every removal is harmless. The operator remains responsible for reviewing and confirming actions.

## License and permissions

Kali Uninstaller is distributed under a **proprietary, all-rights-reserved license**. It is not an open-source project under an OSI-approved license.

You may view the public repository, but viewing or downloading the source does not grant permission to copy, modify, redistribute, sublicense, sell, or commercially exploit the software. Any additional permission must be granted in writing by the copyright holder.

Read the complete [LICENSE](LICENSE) before using or redistributing any part of this project.

## Project

<div align="center">

  **Arctic Fox — Cybersecurity & Linux Tools**

  [GitHub Profile](https://github.com/arcticfox-cyber) · [Repository](https://github.com/arcticfox-cyber/Kali-Uninstaller)

  <sub>© 2026 Arctic Fox. All rights reserved.</sub>

</div>
