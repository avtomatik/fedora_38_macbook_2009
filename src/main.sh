# Following Steps From:
# https://www.schabell.org/2023/01/installing-upgrading-fedora-37-on-macbook-pro-13-inch.html

sudo passwd root

lspci -vnn -d 14e4:

#  ==============================================================================
#  Output
#  ==============================================================================

# 03:00.0 Network controller [0280]: Broadcom Inc. and subsidiaries BCM4322 802.11a/b/g/n Wireless LAN Controller [14e4:432b] (rev 01)
# 	Subsystem: Apple Inc. AirPort Extreme [106b:008d]
# 	Flags: bus master, fast devsel, latency 0, IRQ 20
# 	Memory at 93200000 (64-bit, non-prefetchable) [size=16K]
# 	Capabilities: [40] Power Management version 3
# 	Capabilities: [58] Vendor Specific Information: Len=78 <?>
# 	Capabilities: [e8] MSI: Enable- Count=1/1 Maskable- 64bit+
# 	Capabilities: [d0] Express Endpoint, MSI 00
# 	Capabilities: [100] Advanced Error Reporting
# 	Capabilities: [13c] Virtual Channel
# 	Capabilities: [160] Device Serial Number 26-f0-bb-ff-ff-18-00-26
# 	Capabilities: [16c] Power Budgeting <?>
# 	Kernel driver in use: b43-pci-bridge
# 	Kernel modules: ssb

su -c 'dnf install -y http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm'

su -c 'dnf install -y http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm'

sudo dnf list kernel

# Something Breaks Here
sudo dnf install -y akmods kernel-devel
# sudo dnf install -y akmods kernel-devel-6.2.9-300.fc38

#  ==============================================================================
#  Output
#  ==============================================================================

# You are in emergency mode. After logging in, type "journalctl -xb" to view
# system logs, "systemctl reboot" to reboot, "systemctl default" or "exit"
# to boot into default mode.

# Give root password for maintenance
# (or press Control-D to continue):

#  ==============================================================================
#  Output
#  ==============================================================================

# GRUB version 2.06
# Fedora Linux (6.4.15-200.fc38.x86_64) 38 (Workstation Edition)
# Fedora Linux (6.2.9-300.fc38.x86_64) 38 (Workstation Edition)
# Fedora Linux (0-rescue-7df4cf059c4e490bb4c61d8462b5327e) 38 (Workstation Edition)
# UEFI Firmware Settings

#  ==============================================================================
#  Last Two Options Are Not Available
#  ==============================================================================

# Use the ? and ? keys to select which entry is highlighted.
# Press enter to boot selected OS, `e' to edit the commands
# before booting or `c' for a command-line. ESC to return to previous
# menu.

sudo dnf install -y broadcom-wl

sudo akmods

lsmod | grep wl
