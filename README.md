# Dotfiles

## Setup

1. `# apt-get install git`
2. `$ git clone https://github.com/akrawchyk/dotfiles ./ && cd dotfiles`
3. `$ ./bootstrap.sh`

## Details

### Installs

* Base16
* build-essential
* Cmake
* Node.js
* Tmux
* Vim
* ZSH

### Configures

* Tmux
* Prezto
* Vim Plug

### OSX

#### Brew

* ack
* bfg
* cmake
* coreutils
* dnsmasq
* fasd
* git
* git-extras
* gnu-tar
* heroku-toolbelt
* mercurial
* node
* openssl
* python
* reattach-to-user-namespace
* redis
* sqlite
* terminal-notifier
* the_silver_searcher
* tmux
* vim
* watchman
* wget
* zsh

#### Cask

* adobe-creative-cloud
* android-file-transfer
* dockertoolbox
* dropbox
* firefox
* firefoxdeveloperedition
* flux
* font-anonymous-pro
* font-cousine
* font-droid-sans-mono
* font-fira-mono
* font-inconsolata
* font-meslo-lg
* font-profontx
* font-source-code-pro
* font-terminus
* font-ubuntu
* google-chrome
* google-chrome-canary
* google-hangouts
* iterm2
* java
* karabiner
* keepassx
* licecap
* macdown
* nvalt
* obs
* seil
* sketch
* slack
* spectacle
* spotify
* steam
* the-unarchiver
* vagrant
* virtualbox
* vmware-fusion7
* xquartz

## TODO

* git extras - https://github.com/tj/git-extras

### Tips

* Generating SSH Keys

```
$ ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa_<usage>_$(date +%Y-%m-%d) -C "<usage> key for <owner>"
```

* System-level ad blocking

```
https://github.com/StevenBlack/hosts
```
