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
* Vundle

### OSX

#### Brew

* ack
* coreutils
* dnsmasq
* fasd
* git
* git-extras
* heroku-toolbelt
* mercurial
* node
* python
* reattach-to-user-namespace
* redis
* terminal-notifier
* the_silver_searcher
* tmux
* vim
* watchman
* wget
* zsh

#### Cask

* adobe-creative-cloud* adobe-creative-cloud
* android-file-transfer
* dropbox
* firefox
* firefoxdeveloperedition
* flux
* font-fira-mono
* google-chrome
* google-chrome-canary
* google-hangouts
* iterm2
* karabiner
* keepassx
* macdown
* seil
* slack
* spectacle
* spotify
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
