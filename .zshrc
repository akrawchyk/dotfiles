# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="gallois"
COMPLETION_WAITING_DOTS="true"

# use GNU coreutils and set /usr/local/bin before /usr/bin for homebrew
# rbenv is initialized and added to PATH by oh-my-zsh rbenv plugin
typeset -U path
path=($(brew --prefix coreutils)/libexec/gnubin \
	/usr/local/bin \
	/usr/local/sbin \
	/usr/local/share/npm/bin \
	/usr/local/share/python3 \
	$HOME/.cabal/bin \
	$path)

plugins=(git git-extras rbenv gem rails3 rake bundler capistrano brew osx vagrant)

source $ZSH/oh-my-zsh.sh

source $HOME/.aliases
source $HOME/.functions
source $HOME/.exports
