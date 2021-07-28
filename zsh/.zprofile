export EDITOR="vim"
export VISUAL=$EDITOR
export LANG=en_US.UTF-8
export LC_ALL=$LANG

# https://github.com/zsh-users/antigen/wiki/Commands#antigen-theme
#export ANTIGEN_CACHE="$HOME/.antigen/init-$OSTYPE.zsh"

# https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/Options.md#google-cloud-platform-gcloud
#export SPACESHIP_GCLOUD_SHOW=false
# https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/Options.md#battery-battery
#export SPACESHIP_BATTERY_SHOW=false

# https://github.com/junegunn/fzf#tips
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
#export FZF_DEFAULT_COMMAND="(git ls-tree -r --name-only HEAD || fd --type f --hidden --exclude .git) 2> /dev/null"
export FZF_TMUX=1
export DISABLE_FZF_KEY_BINDINGS=true

export ZSH_AUTOSUGGEST_USE_ASYNC=true

export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export ZSH_TMUX_AUTOSTART=true

#if [[ $TERM_PROGRAM ]]; then
#  export ZSH_TMUX_AUTOSTART_ONCE=false
#fi

if [[ ${commands[brew]} ]]; then
  export HOMEBREW_NO_ANALYTICS=1
fi

if [[ ${commands[bat]} ]]; then
  export BAT_THEME="base16-256"
fi

typeset -gU path fpath cdpath

path=(
  $path
  /usr/local/{bin,sbin}
  $HOME/bin
)

cdpath=(
  $HOME
  $HOME/Developer
  $HOME/src
  $cdpath
)
