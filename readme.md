salt-arch-mac
-------------

Salt configuration to get Arch Linux running on a MacBookPro12,1 (Early 2015).
The idea is to run one script from Arch Linux installation and get a working box.

Steps:

1. Fork this repo and adjust `install.sh` and Salt configuration to your needs
2. Create a new partition on your Mac using **Disk Utility**
3. Boot Arch Linux installation from USB
4. Connect to your wifi using `wifi-menu` and run `install.sh`:
    # wget https://raw.githubusercontent.com/xxxxx/salt-arch-mac/master/install.sh
    # chmod +x install.sh
    # ./install.sh
5. Profit
