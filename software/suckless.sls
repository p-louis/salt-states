/home/{{pillar.username}}/.local/src:
  file.directory:
    - user: {{pillar.username}}
    - group: {{pillar.groupname}} 
    - dir-mode: 755
    - file-mode: 644


{% macro sucklessinstall(pkg) -%}
{{pkg}}-cloned:
  git.latest:
    - name: https://github.com/{{pillar.github_account}}/{{pkg}}.git
    - branch: master
    - target: /home/{{pillar.username}}/.local/src/{{pkg}}

{{pkg}}-build:
  cmd.run:
    - cwd: /home/{{pillar.username}}/.local/src/{{pkg}}
    - name: make

{{pkg}}-install:
  cmd.run:
    - cwd: /home/{{pillar.username}}/.local/src/{{pkg}}
    - name: make install
{%- endmacro %}


{{ sucklessinstall('dwm') }}
{{ sucklessinstall('dwmblocks') }}
{{ sucklessinstall('st') }}
{{ sucklessinstall('dmenu') }}
