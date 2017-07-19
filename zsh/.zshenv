export EDITOR='vim'
export VISUAL=$EDITOR
export PAGER='less'
export LESS='-F -g -i -M -R -S -w -X -z-4'

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

export PATH="$(brew --prefix qt@5.5)/bin:$PATH"

#
# mysql@5.6
#

export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

#
# nvm
#

export NVM_DIR="$HOME/.nvm"

#
# android
#

export ANDROID_SDK_ROOT=/usr/local/share/android-sdk
