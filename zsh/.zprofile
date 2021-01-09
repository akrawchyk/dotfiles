export EDITOR="vim"
export VISUAL=$EDITOR
export PAGER="less"

export LANG=en_US.UTF-8
export LC_ALL=$LANG

# https://github.com/zsh-users/antigen/wiki/Commands#antigen-theme
export ANTIGEN_CACHE=$HOME/.antigen/init-${OSTYPE}.zsh

# https://github.com/junegunn/fzf#tips

export FZF_DEFAULT_COMMAND='fdfind --type f --hidden --follow --exclude .git'
#export FZF_DEFAULT_COMMAND="(git ls-tree -r --name-only HEAD || fd --type f --hidden --exclude .git) 2> /dev/null"
export FZF_TMUX=1
export DISABLE_FZF_KEY_BINDINGS="true"

export ZSH_AUTOSUGGEST_USE_ASYNC=true

if [[ ! $TERM_PROGRAM ]]; then
  export ZSH_TMUX_AUTOSTART=true
fi

if [[ ${commands[brew]} ]]; then
  export HOMEBREW_NO_ANALYTICS=1
  path=("$(brew --prefix mysql@5.6)/bin" $path)
fi

typeset -gU path fpath cdpath

path=(
  $HOME/bin
  /usr/local/{bin,sbin}
  $path
)

cdpath=(
  $HOME
  $HOME/Developer
  $cdpath
)
