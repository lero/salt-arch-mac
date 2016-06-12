# root
root:
  user.present:
    - password: $1$tCoTurOR$ege9S9W/KT30VuROSgMb4/

# root files
{% for f in salt['pillar.get']('root', []) %}
/root/{{ f }}:
  file.managed:
{% if f == '.bashrc' %}
    - source: salt://files/root/{{ f }}
{% else %}
    - source: salt://files/home/{{ f }}
{% endif %}
    - mode: 600
    - user: root
    - owner: root
{% endfor %}

/root/.vim:
  file.symlink:
    - target: /home/gms/.vim

# my user and files
gms:
  user.present:
    - fullname: gms
    - shell: /bin/bash
    - home: /home/gms
    - groups:
      - wheel
      - libvirt
      - adbusers
    - password: $1$kQsu71P0$AJNwxmOvN3HUMN8n6mExS.
    - require:
      - pkg: packages

# dirs
{% for f in salt['pillar.get']('gms_dirs', []) %}
/home/gms/{{ f }}:
  file.directory:
    - user: gms
    - owner: gms
    {% if f == '.ssh' or f == '.ssh/control' %}
    - mode: 700
    {% else %}
    - mode: 750
    {% endif %}
    - makedirs: True
    - require:
      - user: gms
{% endfor %}

# files
{% for f in salt['pillar.get']('gms_files', []) %}
/home/gms/{{ f }}:
  file.managed:
    - source: salt://files/home/{{ f }}
    - mode: 640
    - user: gms
    - owner: gms
    - require:
      - user: gms
{% endfor %}

/home/gms/.config/i3/scripts:
  file.recurse:
    - source: salt://files/home/.config/i3/scripts
    - file_mode: 750
    - user: gms
    - owner: gms
    - require:
      - user: gms

# links
{% for f in salt['pillar.get']('gms_links', []) %}
/home/gms/github/{{ f }}:
  file.symlink:
    - target: /srv/{{ f }}
    - require:
      - user: gms
{% endfor %}

/home/gms/.ssh/config:
  file.symlink:
    - target: /home/gms/Dropbox/ssh/config
    - require:
      - user: gms

# permission
{% for f in salt['pillar.get']('gms_links', []) %}
/srv/{{ f }}:
  file.directory:
    - user: gms
    - group: gms
    - recurse:
      - user
      - group
    - require:
      - user: gms
{% endfor %}
