# 🧹 aaPanel Uninstaller

This repository contains scripts to **uninstall aaPanel** from both **Windows** and **Linux (Debian/Ubuntu/RedHat)** systems.  
Use these scripts if you want to completely remove aaPanel and its related services.

---

## 📌 Features
- Kill all running aaPanel processes (nginx, php, mysql, memcached, aaPanel).
- Remove aaPanel installation directories.
- Clean up environment variables (`PATH`) if needed.
- Works for:
  - **Windows (Batch `.bat` script)**
  - **Linux Ubuntu/Debian (Shell `.sh` script)**
  - **Linux RedHat/CentOS/Rocky/Alma (Shell `.sh` script)**

---

## ⚡ Windows Uninstaller (`uninstall_aapanel.bat`)

### Usage
1. Download the `uninstall_aapanel.bat` file.
2. Right-click → **Run as Administrator**.
3. Enter the aaPanel installation folder path (default: `J:\data\aapanel`).
4. The script will:
   - Kill aaPanel processes
   - Remove aaPanel folder
   - Clean `PATH`
5. Restart Windows to finalize cleanup.

---

## ⚡ Linux Uninstaller (`uninstall_aapanel.sh`)

### Usage
1. Download the `uninstall_aapanel.sh` file.
2. Make it executable:
   ```bash
   chmod +x uninstall_aapanel.sh
