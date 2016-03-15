#!/bin/bash

# arch install comes here - to be done

# install yaourt
echo -e "[archlinuxfr]\nSigLevel = Never\nServer = http://repo.archlinux.fr/\$arch" >> /etc/pacman.conf
pacman -Sy
pacman -S yaourt --noconfirm

# install and run salt
yaourt -S salt-raet git --noconfirm
mkdir -p /var/log/salt /srv/salt/files
git clone https://github.com/lero/salt-arch-mac.git /srv/salt
git clone https://github.com/lero/dotfiles.git /srv/dotfiles
git clone https://github.com/lero/archlinux.git /srv/archlinux
ln -s /srv/dotfiles /srv/salt/files/home
ln -s /srv/archlinux/* /srv/salt/files/
salt-call --local state.highstate --pillar-root=/srv/salt/pillar
