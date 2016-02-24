Salt configuration for Arch Linux on a Macbook

The idea is to run Salt directly from Arch Linux installation, but for now:

yaourt -S salt-raet --noconfirm
cd /srv
sudo git clone https://github.com/lero/salt-arch-mac.git salt
sudo mkdir /var/log/salt /srv/salt/files
mkdir ~/github; cd ~/github
git clone https://github.com/lero/dotfiles.git
git clone https://github.com/lero/archlinux.git
chown -R gms. /srv/salt
ln -s /home/gms/github/dotfiles /srv/salt/files/home
ln -s /home/gms/github/archlinux/* /srv/salt/files/
sudo salt-call --local state.highstate
