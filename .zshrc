#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
	source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

path=(./bin \
	$path \
	/usr/local/share/npm/bin \
	/usr/local/share/python \
	/usr/local/share/python3)

source $HOME/.aliases
source $HOME/.functions
source $HOME/.exports
