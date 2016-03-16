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
    - require:
        - pkg: packages

# dirs
{% for f in salt['pillar.get']('gms_dirs', []) %}
/home/gms/{{ f }}:
  file.directory:
    - user: gms
    - owner: gms
    {% if f == '.ssh' %}
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
  {% if f == '.config/i3/scripts' %}
  file.recurse:
  {% else %}
  file.managed:
  {% endif %}
    - source: salt://files/home/{{ f }}
  {% if f == '.config/i3/scripts' %}
    - file_mode: 750
  {% else %}
    - mode: 640
  {% endif %}
    - user: gms
    - owner: gms
    - require:
        - user: gms
{% endfor %}
