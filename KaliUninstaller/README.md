<div align="center">

  <img src="../logo.png" alt="Kali Uninstaller — Arctic Fox" width="200">

  <h1>KALI UNINSTALLER</h1>
  <h3>WHITEOUT EDITION · v4.3</h3>

  <p><strong>Multi-source graphical uninstaller for Kali Linux.</strong></p>

  <p><a href="https://github.com/arcticfox-cyber/Kali-Uninstaller">Main repository and full documentation</a></p>

</div>

---

This directory contains the application source, installer, launcher, uninstaller, and bundled visual assets.

## Run from source

From this directory:

```bash
chmod +x run.sh
./run.sh
```

If Tkinter is unavailable:

```bash
sudo apt update
sudo apt install -y python3-tk
```

## Install system-wide

```bash
chmod +x install.sh
sudo bash install.sh
```

Launch the installed application:

```bash
kali-uninstaller
```

## Diagnostics

```bash
kali-uninstaller --doctor
```

## Uninstall

After system-wide installation:

```bash
sudo sh /opt/kali-uninstaller/uninstall_me.sh
```

Or run the uninstaller from this source directory:

```bash
sudo sh uninstall_me.sh
```

## Files

- `kali_uninstaller.py` — main application
- `install.sh` — system-wide installer
- `run.sh` — launch from source
- `uninstall_me.sh` — remove the system-wide installation
- `assets/` — application artwork and images

## License

This project is proprietary. See the repository's [LICENSE](../LICENSE) for the complete terms. Public access to this repository does not grant permission to copy, modify, redistribute, or commercially exploit the Software.
