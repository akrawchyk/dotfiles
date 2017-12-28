export EDITOR='vim'
export VISUAL=$EDITOR
export PAGER='less'

export LANG=en_US.UTF-8
export LC_ALL=$LANG

# https://github.com/zsh-users/antigen/wiki/Commands#antigen-theme
export ANTIGEN_CACHE=$HOME/.antigen/init-${OSTYPE}.zsh

export ZSH_TMUX_AUTOSTART=true
export ZSH_AUTOSUGGEST_USE_ASYNC=true

if (( $+commands[brew] )); then
  export HOMEBREW_NO_ANALYTICS=1
fi

#
# qt5 https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit#homebrew
#

if (( $+commands[brew] )); then
  path=("$(brew --prefix qt@5.5)/bin" $path)
fi

#
# mysql@5.6
#

if (( $+commands[brew] )); then
  path=("$(brew --prefix mysql@5.6)/bin" $path)
fi

typeset -gU path fpath cdpath

path=(
  /usr/local/{bin,sbin}
  $HOME/bin
  $path
)

cdpath=(
  $HOME
  $HOME/Developer
  $cdpath
)
