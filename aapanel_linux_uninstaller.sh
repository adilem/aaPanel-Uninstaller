#!/bin/bash
# ================================================
#   Auto Uninstall aaPanel for Linux (Debian/RedHat)
# ================================================

echo "=============================================="
echo "        Auto Uninstall aaPanel for Linux"
echo "=============================================="

# Detect OS family
if [ -f /etc/debian_version ]; then
    OS="debian"
elif [ -f /etc/redhat-release ]; then
    OS="redhat"
else
    OS="unknown"
fi

echo "[*] Detected OS: $OS"

# Stop aaPanel services
echo "[*] Stopping aaPanel services..."
if command -v bt >/dev/null 2>&1; then
    bt stop
fi

# Kill related processes just in case
for PROC in nginx php-fpm mysqld memcached redis aaPanel; do
    pkill -9 $PROC >/dev/null 2>&1
done

# Remove aaPanel folders
echo "[*] Removing aaPanel folders..."
rm -rf /www
rm -rf /usr/local/bt
rm -rf /root/.pip/pip.conf

# Remove init/systemd scripts depending on OS
if [ "$OS" = "debian" ]; then
    echo "[*] Cleaning systemd (Debian/Ubuntu)..."
    systemctl disable bt >/dev/null 2>&1
    systemctl stop bt >/dev/null 2>&1
    rm -f /etc/init.d/bt
    rm -f /lib/systemd/system/bt.service
elif [ "$OS" = "redhat" ]; then
    echo "[*] Cleaning systemd (RedHat/CentOS)..."
    systemctl disable bt >/dev/null 2>&1
    systemctl stop bt >/dev/null 2>&1
    rm -f /etc/init.d/bt
    rm -f /usr/lib/systemd/system/bt.service
else
    echo "[!] Unknown OS family. Skipping service cleanup."
fi

# Reload systemd
systemctl daemon-reload >/dev/null 2>&1

echo
echo "[OK] aaPanel has been removed successfully."
echo "[!] Please reboot your server to complete cleanup."
