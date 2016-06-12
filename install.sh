#!/bin/bash
#
# Arch Linux installation script

# we expect partition 4 to be used
disk="/dev/disk/by-path/pci-0000:04:00.0-ata-1"

if [ ! -h ${disk}-part4 ]; then
  echo "Partition 4 not found"
  exit 1
fi

# set partition 4 to Linux filesystem
echo -e "t\n4\n20\nw" | fdisk $disk

# encrypt entire partition
echo "-> Encrypting partition, enter a password"
cryptsetup -y luksFormat ${disk}-part4
echo "-> Opening encrypted device, enter the password"
cryptsetup open ${disk}-part4 cryptroot

# create file system and mount
mkfs.ext4 /dev/mapper/cryptroot
mount /dev/mapper/cryptroot /mnt

# mount OS X EFI partition on /boot
mount ${disk}-part1 /mnt/boot

# set pacman mirror and enable testing/community-testing
echo "Server = http://ftp.nluug.nl/os/Linux/distr/archlinux/$repo/os/$arch" > /etc/pacman.d/mirrolist
sed -i -e '72, 73 s/^#*//' -e '81, 82 s/^#*//' /etc/pacman.conf

# install base system
pacstrap /mnt base
genfstab -U -p /mnt >> /mnt/etc/fstab

# now inside the final system
cat << EOF | arch-chroot /mnt
echo -e '[archlinuxfr]\nSigLevel = Never\nServer = http://repo.archlinux.fr/$arch' >> /etc/pacman.conf
pacman -Sy
pacman -S yaourt --noconfirm
yaourt -S salt-raet git --noconfirm
git clone https://github.com/lero/salt-arch-mac.git /srv/salt
git clone https://github.com/lero/dotfiles.git /srv/dotfiles
git clone https://github.com/lero/archlinux.git /srv/archlinux
mkdir -p /var/log/salt /srv/salt/files
ln -s /srv/dotfiles /srv/salt/files/home
ln -s /srv/archlinux/* /srv/salt/files/
salt-call --local state.highstate --pillar-root=/srv/salt/pillar
echo nix > /etc/hostname
locale-gen
mkinitcpio -p linux
EOF

# fingers crossed
reboot
