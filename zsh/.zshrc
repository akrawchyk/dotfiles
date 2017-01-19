source ~/.zplug/init.zsh

zplug "zplug/zplug", hook-build:"zplug --self-manage"

zplug "zsh-users/zsh-history-substring-search"

zplug "supercrabtree/k"

zplug load --verbose
