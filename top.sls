# TODO
# - bootctl install/update
# - ssh keys
# - bitlbee config
# - weechat config

base:
  '*':
    - match: compound
    - bootloader
    - packages
    - swap
    - services
    - users
    - etc
