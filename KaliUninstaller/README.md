# Kali Uninstaller

**A graphical package management and removal utility for Kali Linux.**

Kali Uninstaller helps you browse installed packages, inspect package information, and remove selected software through a Tkinter graphical interface. It is designed for Kali Linux and may also work on other Debian-based distributions.

> **Version:** 2.2  
> **License:** Proprietary — see the repository's [LICENSE](../LICENSE).

## Highlights

- **Package browser:** View installed package names, versions, sizes, and descriptions.
- **Search and filters:** Quickly search packages and filter critical packages or packages larger than 100 MB.
- **Package details:** Inspect the selected package and view package statistics.
- **Application icons:** Detect icons from desktop entries, installed icon themes, and system pixmaps. A fallback glyph is used when no matching icon is found.
- **Sorting and navigation:** Sort package columns, use the right-click context menu, and access keyboard shortcuts.
- **Operation feedback:** Review the confirmation dialog and follow the operation log.
- **Privilege handling:** Request elevated privileges through the application's supported privilege flow.
- **Diagnostics:** Run the built-in `--doctor` check to identify common environment and setup issues.
- **Visual interface:** Includes the application logo and splash-screen assets.

## Requirements

- Kali Linux (recommended), or another Debian-based Linux distribution.
- Python 3.
- APT and `dpkg`.
- Tkinter, provided by the `python3-tk` package.

The installer checks for Tkinter and attempts to install `python3-tk` when it is unavailable.

## Installation

Run these commands from the repository root after cloning:

```bash
git clone https://github.com/arcticfox-cyber/Kali-Uninstaller.git
cd Kali-Uninstaller/KaliUninstaller
chmod +x install.sh
sudo ./install.sh
```

The installer:

1. Checks for required application files.
2. Checks for Tkinter and attempts to install `python3-tk` if needed.
3. Installs the application under `/opt/kali-uninstaller`.
4. Creates the `kali-uninstaller` command.
5. Adds an Applications menu entry.
6. Runs the application's diagnostic check.

## Launch the application

**Terminal:**

```bash
kali-uninstaller
```

**Desktop menu:**

```text
Applications → System → Kali Uninstaller
```

## Run without installing

From the `KaliUninstaller/` directory:

```bash
chmod +x run.sh
./run.sh
```

The launcher checks whether Tkinter is available and then starts the application. The application may request your password when elevated privileges are required.

If Tkinter is missing, install it with:

```bash
sudo apt update
sudo apt install -y python3-tk
```

## Using Kali Uninstaller

1. Launch the application.
2. Search for the package you want to inspect, or use the available filters.
3. Select a package to review its details.
4. Verify the package name and information carefully.
5. Start the uninstall action only when you are sure the selected package is safe to remove.
6. Read the confirmation dialog and review APT's proposed actions before approving.

The application uses APT purge and autoremove operations for package removal. APT may propose removing additional dependencies.

## Diagnostics

If the application fails to start or behaves unexpectedly, run the diagnostic mode from the `KaliUninstaller/` directory:

```bash
python3 kali_uninstaller.py --doctor
```

After installation:

```bash
kali-uninstaller --doctor
```

Review the diagnostic output for missing dependencies or environment issues.

## Uninstall Kali Uninstaller

To remove the installed Kali Uninstaller application (not packages previously removed by it), run:

```bash
sudo /opt/kali-uninstaller/uninstall_me.sh
```

This removes the installed application directory, terminal command, and desktop menu entry.

**Important:** Removing Kali Uninstaller does not reinstall software packages that were removed earlier and does not reverse previous APT operations.

## Safety notice

Kali Uninstaller performs privileged package-management operations. The purge operation can delete package configuration files, and autoremove can remove dependencies APT considers no longer required. Removing essential system components may make Kali Linux unstable or unbootable.

- Check every selected package before proceeding.
- Read APT's proposed changes in the confirmation flow.
- Cancel if an essential package or unexpected dependency is listed.
- Keep backups of important files and system configurations.

Use this software only when you understand the consequences of package removal.

## Project files

```text
KaliUninstaller/
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

## License

Copyright (c) 2026 Arctic Fox (@arcticfox-cyber). All rights reserved.

This project is proprietary software and is not distributed under an open-source license. Copying, modifying, redistributing, selling, or creating derivative works requires prior written permission, subject to applicable law.

See the repository's [LICENSE](../LICENSE) file for the full terms.
