NetworkManager:
  service.running:
    - enable: True
    - restart: True
    - watch:
        - file: /etc/NetworkManager/NetworkManager.conf
    - require:
        - pkg: packages
        - file: /etc/NetworkManager/NetworkManager.conf

bitlbee:
  service.running:
    - enable: True
    - require:
        - pkg: packages

libvirtd:
  service.running:
    - enable: True
    - require:
        - pkg: packages

tlp:
  service.running:
    - enable: True
    - require:
        - pkg: packages

tlp-sleep:
  service.enabled
