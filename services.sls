NetworkManager:
  pkg.installed:
    - name: networkmanager
  service.running:
    - enable: True
    - require:
        - pkg: networkmanager

bitlbee:
  pkg.installed: []
  service.running:
    - enable: True
    - require:
        - pkg: bitlbee

libvirtd:
  pkg.installed:
    - name: libvirt
  service.running:
    - enable: True
    - require:
        - pkg: libvirt

tlp:
  pkg.installed: []
  service.running:
    - enable: True
    - require:
        - pkg: tlp

tlp-sleep:
  service.enabled

#systemd-rfkill:
#  service.disabled
