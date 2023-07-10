export EDITOR="nvim"
export VISUAL=$EDITOR
export LANG="C.utf-8"
export LC_ALL=$LANG
  
export ZSH_AUTOSUGGEST_USE_ASYNC=true
export ZSH_TMUX_AUTOSTART=true

export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export NPM_CONFIG_PREFIX=~/.npm-global

#if [[ $TERM_PROGRAM ]]; then
#  export ZSH_TMUX_AUTOSTART_ONCE=false
#fi

if [[ ${commands[brew]} ]]; then
  export HOMEBREW_NO_ANALYTICS=1
fi

if [[ ${commands[bat]} ]]; then
  export BAT_THEME="base16-256"
fi

export GPG_TTY=$(tty)

# Don't add asdf shims to PATH
# https://github.com/asdf-community/asdf-direnv#pro-tips
export PATH="$PATH:$HOME/.asdf/bin"

source "$HOME/.cargo/env"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin"

. "$HOME/.cargo/env"
