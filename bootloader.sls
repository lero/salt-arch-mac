# TODO: bootctl install/update

/boot/loader/loader.conf:
  file.managed:
    - source: salt://files/boot/loader/loader.conf
    - user: root
    - owner: root

# get uuids
{% set root_uuid = salt['disk.blkid']('/dev/sda4')['/dev/sda4']['UUID'] %}
{% set crypt_uuid = salt['disk.blkid']('/dev/mapper/cryptroot')['/dev/mapper/cryptroot']['UUID'] %}

/boot/loader/entries/arch.conf:
  file.managed:
    - source: salt://files/boot/loader/entries/arch.conf
    - template: jinja
    - user: root
    - owner: root
    - context:
        root: {{ root_uuid }}
        crypt: {{ crypt_uuid }}

/boot/loader/entries/arch-dev.conf:
  file.managed:
    - source: salt://files/boot/loader/entries/arch-dev.conf
    - template: jinja
    - user: root
    - owner: root
    - context:
        root: {{ root_uuid }}
        crypt: {{ crypt_uuid }}
