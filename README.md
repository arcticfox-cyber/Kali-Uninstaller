<div align="center">

<img src="https://readme-typing-svg.demolab.com?font=JetBrains+Mono&weight=800&size=34&duration=2800&pause=900&color=00E5FF&center=true&vCenter=true&repeat=true&width=850&height=90&lines=KALI+UNINSTALLER;CONTROL+YOUR+PACKAGES;BROWSE+%E2%80%A2+REVIEW+%E2%80%A2+REMOVE" alt="Kali Uninstaller animated title" />

<p><strong>A clean graphical package manager for Kali Linux</strong></p>

<p>
  <img src="https://img.shields.io/badge/KALI_LINUX-SUPPORTED-557C94?style=flat-square&logo=kalilinux&logoColor=white" alt="Kali Linux supported" />
  <img src="https://img.shields.io/badge/PYTHON-3.x-3776AB?style=flat-square&logo=python&logoColor=white" alt="Python 3" />
  <img src="https://img.shields.io/badge/LICENSE-PROPRIETARY-red?style=flat-square" alt="Proprietary license" />
</p>

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
