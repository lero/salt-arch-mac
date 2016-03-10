gms:
  user.present:
    - fullname: gms
    - shell: /bin/bash
    - home: /home/gms
    - groups:
      - wheel
      - libvirt
      - adbusers

/home/gms/.bash_profile:
  file.managed:
    - source: salt://files/home/.bash_profile
    - mode: 640
    - user: gms
    - owner: gms
    - require:
        - user: gms

/home/gms/.bashrc:
  file.managed:
    - source: salt://files/home/.bashrc
    - mode: 640
    - user: gms
    - owner: gms
    - require:
        - user: gms

/home/gms/.gitconfig:
  file.managed:
    - source: salt://files/home/.gitconfig
    - mode: 640
    - user: gms
    - owner: gms
    - require:
        - user: gms

/home/gms/.i3blocks.conf:
  file.managed:
    - source: salt://files/home/.i3blocks.conf
    - mode: 640
    - user: gms
    - owner: gms
    - require:
        - user: gms

/home/gms/.tmux.conf:
  file.managed:
    - source: salt://files/home/.tmux.conf
    - mode: 640
    - user: gms
    - owner: gms
    - require:
        - user: gms

/home/gms/.toprc:
  file.managed:
    - source: salt://files/home/.toprc
    - mode: 640
    - user: gms
    - owner: gms
    - require:
        - user: gms

/home/gms/.vimrc:
  file.managed:
    - source: salt://files/home/.vimrc
    - mode: 640
    - user: gms
    - owner: gms
    - require:
        - user: gms

/home/gms/.xinitrc:
  file.managed:
    - source: salt://files/home/.xinitrc
    - mode: 640
    - user: gms
    - owner: gms
    - require:
        - user: gms

/home/gms/.mplayer:
  file.directory:
    - user: gms
    - owner: gms
    - require:
        - user: gms

/home/gms/.mplayer/config:
  file.managed:
    - source: salt://files/home/.mplayer/config
    - mode: 640
    - user: gms
    - owner: gms
    - require:
        - user: gms
        - file: /home/gms/.mplayer

/home/gms/.config/mpv:
  file.directory:
    - user: gms
    - group: gms
    - mode: 750
    - makedirs: True

/home/gms/.config/mpv/mpv.conf:
  file.managed:
    - source: salt://files/home/.config/mpv/mpv.conf
    - mode: 640
    - user: gms
    - owner: gms
    - require:
        - user: gms
        - file: /home/gms/.config/mpv

/home/gms/.config/i3/scripts:
  file.recurse:
    - source: salt://files/home/.config/i3/scripts
    - user: gms
    - owner: gms
    - file_mode: 750
    - require:
        - user: gms

/home/gms/devel/go:
  file.directory:
    - user: gms
    - group: gms
    - mode: 750
    - makedirs: True
    - require:
        - user: gms

/home/gms/pictures:
  file.directory:
    - user: gms
    - group: gms
    - mode: 750
    - require:
        - user: gms

/home/gms/downloads:
  file.directory:
    - user: gms
    - group: gms
    - mode: 750
    - require:
        - user: gms

/home/gms/documents:
  file.directory:
    - user: gms
    - group: gms
    - mode: 750
    - require:
        - user: gms

/home/gms/temp:
  file.directory:
    - user: gms
    - group: gms
    - mode: 750
    - require:
        - user: gms
