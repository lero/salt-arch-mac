/root/.tmux.conf:
  file.managed:
    - source: salt://files/home/.tmux.conf
    - mode: 644
    - user: root
    - owner: root

/root/.bashrc:
  file.managed:
    - source: salt://files/root/.bashrc
    - mode: 644
    - user: root
    - owner: root

/root/.bash_profile:
  file.managed:
    - source: salt://files/home/.bash_profile
    - mode: 644
    - user: root
    - owner: root

/root/.toprc:
  file.managed:
    - source: salt://files/home/.toprc
    - mode: 644
    - user: root
    - owner: root

/root/.vimrc:
  file.managed:
    - source: salt://files/home/.vimrc
    - mode: 644
    - user: root
    - owner: root
