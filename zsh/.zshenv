export EDITOR='vim'
export VISUAL=$EDITOR
export PAGER='less'
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Homebrew
if (( $+commands[brew] )); then
	export HOMEBREW_NO_ANALYTICS=1
fi

# NVM
export NVM_LAZY_LOAD=true
export NVM_AUTO_USE=true

#
# Paths
#

typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
cdpath=(
  $HOME
  $HOME/Developer
  $cdpath
)

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  /usr/{bin,sbin}
  /{bin,sbin}
  $path
)
