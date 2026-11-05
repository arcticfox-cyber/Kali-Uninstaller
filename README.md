<div align="center">

<h1 align="center"><strong>KALI UNINSTALLER</strong></h1>

<img src="kali-uninstaller-banner.jpg" alt="Kali Uninstaller wolf banner" width="240" />

<p><strong>A graphical package-removal utility for Kali Linux</strong></p>

<p>
  <img src="https://img.shields.io/badge/KALI_LINUX-SUPPORTED-557C94?style=flat-square&logo=kalilinux&logoColor=white" alt="Kali Linux supported" />
  <img src="https://img.shields.io/badge/PYTHON-3.x-3776AB?style=flat-square&logo=python&logoColor=white" alt="Python 3" />
  <img src="https://img.shields.io/badge/LICENSE-PROPRIETARY-red?style=flat-square" alt="Proprietary license" />
</p>

</div>

---

**Kali Uninstaller** helps you browse installed packages, inspect package information, and remove selected software through a graphical interface. It is designed for Kali Linux and may also work on other Debian-based distributions.

The application uses APT to purge selected packages and remove automatically installed dependencies that are no longer required. It requests elevated privileges when needed. Always review the packages and APT's proposed changes before confirming removal.

## ✨ Features


- Graphical package browser with package names, versions, sizes, and descriptions.
- Search and filters for all packages, critical packages, and packages larger than 100 MB.
- Package icons detected from desktop entries, installed icon themes, and system pixmaps.
- Package details panel and package statistics.
- Sortable package, version, and size columns.
- Right-click context menu and keyboard shortcuts.
- Confirmation dialog and operation log.
- Automatic privilege handling through `pkexec` or `sudo`.
- Diagnostic mode with `--doctor`.
- Embedded visual assets.

## ⚙️ Requirements


- Kali Linux or another Debian-based Linux distribution.
- Python 3.
- `python3-tk` (Tkinter).
- APT and `dpkg`.

The installer checks for Tkinter and attempts to install `python3-tk` if it is missing.

## 🚀 Step 1 — Download the project


Clone the repository:

```bash
git clone https://github.com/arcticfox-cyber/Kali-Uninstaller.git
```

Enter the project directory:

```bash
cd Kali-Uninstaller
```

If you downloaded the ZIP from GitHub instead, extract it and open a terminal in the extracted project folder.

## 📦 Step 2 — Install Kali Uninstaller


Make the installer executable:

```bash
chmod +x install.sh
```

Run the installer with administrator privileges:

```bash
sudo ./install.sh
```

The installer places the application in `/opt/kali-uninstaller`, creates the `kali-uninstaller` command, adds a desktop Applications menu entry, and runs a diagnostic check.

## 🖥️ Step 3 — Launch the application


**Launch from any terminal:**

```bash
kali-uninstaller
```

**Or launch from the desktop menu:**

```text
Applications → System → Kali Uninstaller
```

**Run directly from the downloaded project without installing:**

```bash
chmod +x run.sh
./run.sh
```

## 🐍 Step 4 — Browse and select packages


1. Open Kali Uninstaller.
2. Search for the package you want to inspect.
3. Use the available filters to narrow the package list.
4. Select a package to review its details.
5. Check the package name, version, size, and information carefully.

## 🔍 Step 5 — Review before removal


1. Select only the package or packages you intend to remove.
2. Review your selected packages.
3. Read the confirmation dialog before proceeding.
4. Check APT's proposed actions.
5. Cancel if an essential package or an unexpected dependency is listed.

## 🗑️ Step 6 — Uninstall selected packages


When you confirm the operation, Kali Uninstaller uses APT purge and autoremove to remove the selected packages and dependencies that APT considers no longer required.

**Important:** Purge can remove package configuration files. Removing essential system packages can break Kali Linux or make it unbootable. Do not remove packages unless you understand their purpose.

## 🩺 Diagnostics


If the application fails to start or you encounter an issue, run the diagnostic command from the project directory:

```bash
python3 kali_uninstaller.py --doctor
```

After installation, you can also try:

```bash
kali-uninstaller --doctor
```

The diagnostic mode checks the application environment and reports common setup problems.

## ❌ Uninstallation — Remove Kali Uninstaller


To uninstall the **Kali Uninstaller application itself** (not packages you previously removed), run:

```bash
sudo /opt/kali-uninstaller/uninstall_me.sh
```

This removes the installed application files, command, and desktop menu entry.

**Please note:**
- This command removes Kali Uninstaller itself.
- It does not restore software packages removed earlier.
- It does not undo previous APT purge or autoremove operations.

## ⌨️ Useful commands


| Task | Command |
|---|---|
| Clone repository | `git clone https://github.com/arcticfox-cyber/Kali-Uninstaller.git` |
| Enter project folder | `cd Kali-Uninstaller` |
| Make installer executable | `chmod +x install.sh` |
| Install | `sudo ./install.sh` |
| Launch installed app | `kali-uninstaller` |
| Run without installing | `./run.sh` |
| Run diagnostics | `python3 kali_uninstaller.py --doctor` |
| Uninstall the application | `sudo /opt/kali-uninstaller/uninstall_me.sh` |

## ⚠️ Safety notice


Kali Uninstaller performs package-management operations with elevated privileges. Removing critical packages or dependencies can damage your operating system. Always verify every selection and review APT's proposed changes. Keep backups of important data.

## 📄 License


Kali Uninstaller is proprietary software. All rights are reserved by the copyright holder. Copying, modifying, distributing, sublicensing, or reusing this software requires prior written permission.

See the [LICENSE](LICENSE) file for the complete terms.
