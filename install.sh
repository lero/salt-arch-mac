#!/bin/bash

# arch install - not finished
# missing: wifi/dhcp setup, fdisk/mkfs/mount
echo "Server = http://ftp.nluug.nl/os/Linux/distr/archlinux/$repo/os/$arch" > /etc/pacman.d/mirrolist
sed -i '72, 73 s/^#*//' /etc/pacman.conf
pacstrap /mnt base
genfstab -p /mnt >> /mnt/etc/fstab

# now inside the real installation
cat << EOF | arch-chroot /mnt
echo -e "[archlinuxfr]\nSigLevel = Never\nServer = http://repo.archlinux.fr/\$arch" >> /etc/pacman.conf
pacman -Sy
pacman -S yaourt --noconfirm
yaourt -S salt-raet git --noconfirm
mkdir -p /var/log/salt /srv/salt/files
git clone https://github.com/lero/salt-arch-mac.git /srv/salt
git clone https://github.com/lero/dotfiles.git /srv/dotfiles
git clone https://github.com/lero/archlinux.git /srv/archlinux
ln -s /srv/dotfiles /srv/salt/files/home
ln -s /srv/archlinux/* /srv/salt/files/
salt-call --local state.highstate --pillar-root=/srv/salt/pillar
EOF
