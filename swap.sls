/var/swap:
  cmd.run:
    - name: |
        [ -f /var/swap ] || fallocate -l 4G /var/swap
        chmod 0600 /var/swap
        mkswap /var/swap
        swapon /var/swap
    - unless: file /var/swap 2>&1 | grep -q "Linux/i386 swap"
  mount.swap:
    - persist: true
