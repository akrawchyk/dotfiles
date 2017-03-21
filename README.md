# Akrawchyk's Dotfiles

# Usage

Install [stow](https://www.gnu.org/software/stow/) (pick one).

```
# Debian

sudo apt-get install stow

# MacOS

brew install stow
```

Then selectively stow what you need

```
cd dotfiles
stow --target=$HOME -S zsh ssh git hg alacritty

# MacOS

stow --target=$HOME -S macos

# Tmux+Vim

stow --target=$HOME -S tmux vim

# JS

stow --target=$HOME -S js
```

# Tips

* Generating SSH Keys

```
$ ssh-keygen -o -a 100 -t ed25519
```

old:

```
$ ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa_<usage>_$(date +%Y-%m-%d) -C "<usage> key for <owner>"
```

* System-level ad blocking

```
https://github.com/StevenBlack/hosts
```
