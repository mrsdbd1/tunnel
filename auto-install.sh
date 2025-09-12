#!/bin/bash
set -e

# 🎨 Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

clear

# 🚀 Banner
echo -e "${CYAN}"
echo "╔════════════════════════════════════════════════════════╗"
echo "║                                                        ║"
echo "║    ✈️  LP NODES - Port Forwarding Tool Installer 🎉    ║"
echo "║                                                        ║"
echo "╚════════════════════════════════════════════════════════╝"
echo -e "${NC}"

sleep 1

# 🔄 Animation function
animate() {
    local msg=$1
    echo -ne "   ${YELLOW}${msg}${NC}"
    for i in {1..3}; do
        echo -ne "."
        sleep 0.5
    done
    echo ""
}

animate "Cloning repository"
git clone https://github.com/mrsdbd1/tunnel.git /opt/port-forwarding-tool >/dev/null 2>&1 || true

cd /opt/port-forwarding-tool

animate "Running installer"
chmod +x install.sh
./install.sh

animate "Configuring SSH"
sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config

animate "Restarting SSH service"
service ssh restart

echo ""
echo -e "${GREEN}✅ Installation complete! your powerting by lp nodes${NC}"
echo -e "${CYAN}➡️  You can now use: ${YELLOW}port help${NC}"
echo ""
