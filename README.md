<div align="center">

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=700&size=28&pause=1000&color=00D9FF&center=true&vCenter=true&width=650&lines=Kali+Uninstaller;Clean+up+your+Kali+Linux+system;Browse.+Review.+Uninstall." alt="Animated Kali Uninstaller title" />

**A graphical package-removal utility for Kali Linux**

![Platform](https://img.shields.io/badge/Platform-Kali%20Linux-557C94?style=for-the-badge&logo=kalilinux&logoColor=white)
![Python](https://img.shields.io/badge/Python-3.x-3776AB?style=for-the-badge&logo=python&logoColor=white)
![License](https://img.shields.io/badge/License-Proprietary-red?style=for-the-badge)

</div>

---

**Kali Uninstaller** is a graphical package-removal utility for Kali Linux and other Debian-based systems. It helps you find installed packages, review package details, and remove selected software through a focused interface with a confirmation step.

The application runs with elevated privileges when required and uses APT to purge selected packages and remove automatically installed dependencies that are no longer needed. Because package removal can affect your operating system, review every selection carefully before confirming.

## Features

- **Graphical package browser** with package names, versions, sizes, and descriptions.
- **Fast search and filtering** for installed packages, including critical packages and large packages.
- **Package icons** detected from installed desktop entries and system icon themes.
- **Package details and statistics** to help review selections before removal.
- **Sorting and selection tools**, including keyboard shortcuts and a right-click menu.
- **Removal confirmation and live operation log** before and during package removal.
- **Root privilege handling** through `pkexec` or `sudo`.
- **Built-in diagnostic check** available with `--doctor`.
- **Embedded visual assets** and a minimal runtime requirement.

## Requirements

- Kali Linux (Debian-based distributions may also work).
- Python 3.
- `python3-tk` for the graphical interface.
- APT and `dpkg`.

The installer checks for Tkinter and attempts to install `python3-tk` if it is missing.

## Installation

1. Download or clone this repository.
2. Open a terminal in the extracted `KaliUninstaller` directory.
3. Run:

```bash
chmod +x install.sh
sudo ./install.sh
```

The installer places the application under `/opt/kali-uninstaller`, creates the `kali-uninstaller` command, adds an Applications menu entry, and runs a diagnostic check.

## Launching

**From a terminal:**

```bash
kali-uninstaller
```

**From the desktop:** open **Applications → System → Kali Uninstaller**.

**Run without installing:**

```bash
chmod +x run.sh
./run.sh
```

## Using Kali Uninstaller

1. Launch the application.
2. Search for a package or use the available filters.
3. Select the package or packages you want to remove.
4. Review the selection and the confirmation dialog carefully.
5. Confirm the operation to start removal.

The application uses APT purge and autoremove operations. This can remove configuration files and dependencies, so do not remove packages unless you understand their purpose.

## Diagnostics

If the application does not start or behaves unexpectedly, run:

```bash
python3 kali_uninstaller.py --doctor
```

This diagnostic mode checks the application environment and reports common setup issues.

## Uninstallation

To remove the installed application, run the included uninstaller:

```bash
sudo /opt/kali-uninstaller/uninstall_me.sh
```

This removes the Kali Uninstaller application files, command, and desktop menu entry. It does not uninstall packages previously removed by the application or restore packages that were removed.

## Safety Notice

Kali Uninstaller performs package-management operations with elevated privileges. Removing essential packages may make the system unstable or unusable. Always check package names and review APT's proposed changes before proceeding. Use the tool at your own risk and keep important data backed up.

## License

Kali Uninstaller is proprietary software. All rights are reserved by the copyright holder. Copying, modifying, distributing, sublicensing, or reusing the software requires prior written permission.

See the [LICENSE](LICENSE) file for the full terms.
