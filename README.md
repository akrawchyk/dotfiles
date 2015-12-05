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

## TODO

* git extras - https://github.com/tj/git-extras

### Tips

* Generating SSH Keys

```
$ ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa_<usage>_$(date +%Y-%m-%d) -C "<usage> key for <owner>"
```
