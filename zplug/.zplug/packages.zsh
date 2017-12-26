zplug "zplug/zplug", hook-build:"zplug --self-manage"

zplug "~/.zsh", from:local, use:'aliases.zsh'

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "unixorn/tumult.plugin.zsh", if: "[[ $OSTYPE == *darwin* ]]"
zplug "modules/dpkg", from:prezto, if: "[[ $OSTYPE == *linux-gnu* ]]"
zplug "modules/git", from:prezto
zplug "modules/rails", from:prezto
zplug "denysdovhan/spaceship-zsh-theme", use:spaceship.zsh, as:theme
zplug "supercrabtree/k"
zplug "creationix/nvm", use:nvm.sh
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf

zplug check || zplug install
zplug load

if zplug check "creationix/nvm"; then
  # auto use .nvmrc
  autoload -U add-zsh-hook
  load-nvmrc() {
    if [[ -f .nvmrc && -r .nvmrc ]]; then
      nvm use
    fi
  }
  add-zsh-hook chpwd load-nvmrc
fi

if zplug check "zsh-users/zsh-history-substring-search"; then
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
fi
