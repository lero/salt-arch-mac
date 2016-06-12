packages:
  pkg.latest:
    - pkgs:
      - acpi
      - alsa-utils
      - android-tools
      - android-udev
      - ansible
      - aspell-en
      - automake
      - bash-completion
      - bind-tools
      - binutils
      - bison
      - bitlbee
      - bridge-utils
      - chromium
      - cups
      - cups-pdf
      - curl
      - dialog
      - dmenu
      - dmidecode
      - dnsmasq
      - dosfstools
      - dropbox
      - dunst
      - ebtables
      - eog
      - ethtool
      - evince
      - exfat-utils
      - fakeroot
      - figlet
      - firefox
      - flex
      - gc
      - gcc
      - ghostscript
      - git
      - go
      - gsfonts
      - guile
      - htop
      - i3lock
      - i3status
      - i3-wm
      - imagemagick
      - intel-ucode
      - ipython
      - iw
      - jq
      - lib32-mesa-libgl
      - libmpc
      - libva-intel-driver
      - libvirt
      - lm_sensors
      - make
      - mercurial
      - mplayer
      - mpv
      - mtr
      - ntfs-3g
      - neovim
      - networkmanager
      - nmap
      - notify-osd
      - openbsd-netcat
      - openssh
      - parted
      - pavucontrol
      - pkg-config
      - pkgfile
      - powertop
      - pulseaudio
      - qemu
      - redshift
      - rsync
      - scrot
      - skype
      - strace
      - sudo
      - sysstat
      - system-config-printer
      - transmission-gtk
      - tcpdump
      - tlp
      - tmux
      - ttf-bitstream-vera
      - vim
      - virt-manager
      - weechat
      - wget
      - whois
      - wpa_supplicant
      - x11-ssh-askpass 
      - xautolock
      - xf86-input-libinput
      - xf86-video-intel
      - xorg-bdftopcf
      - xorg-xinit
      - xorg-luit
      - xorg-mkfontdir
      - xorg-mkfontscale
      - xorg-server
      - xorg-server-utils
      - xorg-setxkbmap
      - xorg-smproxy
      - xorg-x11perf
      - xorg-xauth
      - xorg-xcursorgen
      - xorg-xdpyinfo
      - xorg-xdriinfo
      - xorg-xev
      - xorg-xkbcomp
      - xorg-xkbevd
      - xorg-xkbutils
      - xorg-xkill
      - xorg-xlsatoms
      - xorg-xlsclients
      - xorg-xpr
      - xorg-xprop
      - xorg-xvinfo
      - xorg-xwd
      - xorg-xwininfo
      - xorg-xwud
      - xsel
      - yaourt
    - require:
      - file: /etc/pacman.conf

# vim
/home/gms/.vim/autoload/pathogen.vim:
  file.managed:
    - source: https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
    - source_hash: md5=a36402926ee8e1e0341b3d52bab75b0d
    - user: gms
    - mode: 0640
    - require:
      - user: gms
      - file: /home/gms/.vim/autoload

vim-go:
  git.latest:
    - name: https://github.com/fatih/vim-go.git
    - target: /home/gms/.vim/bundle/vim-go
    - user: gms
    - require:
      - user: gms
      - file: /home/gms/.vim/bundle
      - pkg: packages

vim-colors-solarized:
  git.latest:
    - name: https://github.com/altercation/vim-colors-solarized.git
    - target: /home/gms/.vim/bundle/vim-colors-solarized
    - user: gms
    - require:
      - user: gms
      - file: /home/gms/.vim/bundle
      - pkg: packages

salt-vim:
  git.latest:
    - name: https://github.com/saltstack/salt-vim.git
    - target: /home/gms/.vim/bundle/salt-vim
    - user: gms
    - require:
      - user: gms
      - file: /home/gms/.vim/bundle
      - pkg: packages

bin:
  git.latest:
    - name: https://github.com/lero/shell.git
    - target: /home/gms/bin
    - user: gms
    - require:
      - user: gms
      - pkg: packages

# aur
{% for p in salt['pillar.get']('aur', []) %}
{{ p }}:
  cmd.run:
    - name: su -c "yaourt -S {{ p }} --noconfirm" gms
    - unless: pacman -Q {{ p }}
{% endfor %}
