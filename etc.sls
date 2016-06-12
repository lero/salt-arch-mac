/etc/localtime:
  file.symlink:
    - target: /usr/share/zoneinfo/Europe/Amsterdam

/etc/pacman.conf:
  file.managed:
    - source: salt://files/etc/pacman.conf
    - mode: 644
    - user: root
    - owner: root

/etc/locale.gen:
  file.managed:
    - source: salt://files/etc/locale.gen
    - mode: 644
    - user: root
    - owner: root

/etc/locale.conf:
  file.managed:
    - source: salt://files/etc/locale.conf
    - mode: 644
    - user: root
    - owner: root

/etc/makepkg.conf:
  file.managed:
    - source: salt://files/etc/makepkg.conf
    - mode: 644
    - user: root
    - owner: root

/etc/sudoers:
  file.managed:
    - source: salt://files/etc/sudoers
    - mode: 440
    - user: root
    - owner: root

/etc/inputrc:
  file.managed:
    - source: salt://files/etc/inputrc
    - mode: 440
    - user: root
    - owner: root

/etc/mkinitcpio.conf:
  file.managed:
    - source: salt://files/etc/mkinitcpio.conf
    - mode: 644
    - user: root
    - owner: root

/etc/pacman.d/mirrorlist:
  file.managed:
    - source: salt://files/etc/pacman.d/mirrolist
    - mode: 644
    - user: root
    - owner: root

/etc/udev/rules.d/99-monitor_hotplug.rules:
  file.managed:
    - source: salt://files/etc/udev/rules.d/99-monitor_hotplug.rules
    - mode: 644
    - user: root
    - owner: root

/etc/systemd/system/monitor_hotplug.service:
  file.managed:
    - source: salt://files/etc/systemd/system/monitor_hotplug.service
    - mode: 644
    - user: root
    - owner: root

/etc/systemd/logind.conf:
  file.managed:
    - source: salt://files/etc/systemd/logind.conf
    - mode: 644
    - user: root
    - owner: root

/etc/NetworkManager/NetworkManager.conf:
  file.managed:
    - source: salt://files/etc/NetworkManager/NetworkManager.conf
    - mode: 644
    - user: root
    - owner: root

/etc/X11/xorg.conf.d:
  file.recurse:
    - source: salt://files/etc/X11/xorg.conf.d
    - file_mode: 644
    - user: root
    - owner: root

/etc/modprobe.d:
  file.recurse:
    - source: salt://files/etc/modprobe.d
    - file_mode: 644
    - user: root
    - owner: root

/etc/modules-load.d:
  file.recurse:
    - source: salt://files/etc/modules-load.d
    - file_mode: 644
    - user: root
    - owner: root

/etc/mkinitcpio.d:
  file.recurse:
    - source: salt://files/etc/mkinitcpio.d
    - file_mode: 644
    - user: root
    - owner: root

vm.swappiness:
  sysctl.present:
    - value: 1
    - config: /etc/sysctl.d/99-sysctl.conf
