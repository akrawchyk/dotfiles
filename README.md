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
* android-sdk
* bfg
* chromedriver
* cmake
* cookiecutter
* coreutils
* ctags
* dnsmasq
* fasd
* git
* git-extras
* gnu-tar
* heroku-toolbelt
* imagemagick
* mercurial
* node
* nvm
* openssl
* python
* reattach-to-user-namespace
* redis
* sqlite
* terminal-notifier
* tidy-html5
* the_silver_searcher
* tree
* tmux
* vim
* watchman
* wget
* zsh

#### Cask

* adobe-air
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
* font-nova-mono
* font-profontx
* font-roboto-mono
* font-source-code-pro
* font-terminus
* font-ubuntu
* font-vt323
* google-chrome
* google-chrome-canary
* google-hangouts
* iterm2
* jadengeller-helium
* java
* karabiner
* keepassx
* licecap
* macdown
* medis
* nvalt
* obs
* owasp-zap
* postico
* postman
* qlstephen
* screenhero
* seil
* sketch
* sketch-toolbox
* slack
* spectacle
* spotifree
* spotify
* steam
* steelseries-engine
* steelseries-exactmouse-tool
* the-unarchiver
* vagrant
* virtualbox
* vlc
* wireshark
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
