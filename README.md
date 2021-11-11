# Pop!_OS Ansible Bootstrapper
This is an ansible playbook used to bootstrap a Pop!_OS install from a clean install, installing and configuring most components that are common on all systems. 

This is designed for Pop!_OS 21.04.

## What it does
- Configures the desktop background, dock, screen lock, keybinds, etc
- Configures flathub as the default flatpak remote
- Installs:
  - Google Chrome
  - VS Code (+ extensions and configuration)
  - Jabba (+ OpenJDK 1.17.0)
  - Rustlang (via rustup)
  - NodeJS (+ npm and yarn)
  - Recoll
  - NVIM (+ configuration and vimplug)
  - Docker
  - Oh-my-ZSH (+ configuration)
  - Spotify
  - Discord
  - Zotero
  - Flameshot (+ keybind to PRTSCRN)
  - SpeedCrunch
  - Tmux
  - Misc apt packages (tree, bpytop, htop, iperf3, etc)
  - Git
  - SSH
  - GParted
  - Native development tools (build-essential, clang, g++, gdb, multilib)

## What it doesn't do
- Configure hostname, SSH, and Git
- Install applications that are difficult to automate (e.g. MATLAB, Insync)

## Getting started
From a fresh Pop!_OS 21.04 install (user: `jaci`)
```bash
$ sudo apt update && sudo apt install ansible
$ ansible-galaxy install -r requirements.txt
$ ansible-playbook playbook.yml --ask-become-pass
```

Note some components may fail on the first run due to a `/var/lib/dpkg/lock` issue, likely due to a system task like Pop!_Shop running updates in the background. Let it finish and then rerun the playbook.