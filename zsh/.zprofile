export EDITOR='vim'
export VISUAL=$EDITOR
export PAGER='less'
export LESS='-F -g -i -M -R -S -w -X -z-4'

#
# Locale
#

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

#
# Homebrew
#

# disable analytics
if (( $+commands[brew] )); then
  export HOMEBREW_NO_ANALYTICS=1
fi

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
  $HOME/bin
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
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

#
# nvm
#

export NVM_DIR="$HOME/.nvm"

#
# pyenv
#

export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_ROOT="$HOME/.pyenv"
path=("$PYENV_ROOT/bin" $path)

#
# jenv
#

export JENV_ROOT="$HOME/.jenv"
path=("$JENV_ROOT/bin" $path)

#
# rust
#

path=("$HOME/.cargo/bin" $path)

#
# android
#

# export ANDROID_SDK_ROOT=/usr/local/share/android-sdk

#
# spaceship
#

export SPACESHIP_PROMPT_PREFIXES_SHOW=false
export SPACESHIP_DOCKER_SHOW=false
export SPACESHIP_PACKAGE_SHOW=false

#
# zsh-autosuggestions
#

export ZSH_AUTOSUGGEST_USE_ASYNC=true

#
# fzf
#

# https://github.com/junegunn/fzf#tips
export FZF_DEFAULT_COMMAND='
  (git ls-tree -r --name-only HEAD ||
       find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
        sed s/^..//) 2> /dev/null'
