# TODO: ssh keys, bitlbee config, weechat config, infinality fonts (need repo keys) 
# and bootctl install/update

base:
  'G@os:Arch and G@productname:MacBookPro12,1':
    - match: compound
    - bootloader
    - packages
    - swap
    - services
    - users
    - etc
