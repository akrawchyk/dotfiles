zplug "zplug/zplug", hook-build:"zplug --self-manage"

zplug "~/.zsh", from:local, use:'aliases.zsh'

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "modules/git", from:prezto
zplug "nojhan/liquidprompt"
zplug "unixorn/tumult.plugin.zsh"
zplug "supercrabtree/k"

fasd_cache="$HOME/.fasd-init-zsh"
zplug "clvv/fasd", \
	as:command, \
	use:fasd, \
	hook-build:"./fasd --init auto >| \"$fasd_cache\"; fi"

zplug load

source "$fasd_cache"
unset fasd_cache
