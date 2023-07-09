setopt promptsubst

zstyle :omz:plugins:keychain agents ssh
zstyle :omz:plugins:keychain identities id_ed25519
zstyle :omz:plugins:keychain options --quiet --inherit any

source ~/.zinit/bin/zinit.zsh

zinit snippet OMZP::keychain

zinit ice depth"1" # git clone depth
zinit light romkatv/powerlevel10k

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

zinit ice svn
zinit snippet OMZP::tmux

#zinit snippet OMZL::clipboard.zsh
#zinit snippet OMZL::completion.zsh
#zinit snippet OMZL::functions.zsh
#zinit snippet OMZL::history.zsh
#zinit snippet OMZL::theme-and-appearance.zsh
#zinit snippet OMZL::misc.zsh

zinit wait lucid for \
  atinit"zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
    OMZL::clipboard.zsh \
    OMZL::completion.zsh \
    OMZL::functions.zsh \
    OMZL::history.zsh \
    OMZL::theme-and-appearance.zsh \
    OMZL::misc.zsh \
    OMZP::colored-man-pages \
    OMZP::asdf \
    OMZP::dotenv \
    OMZP::gcloud \
    OMZP::brew \
    OMZP::kubectl \
  atload"_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
    zsh-users/zsh-completions

zinit wait lucid for \
  from"gh-r" as"program" \
    junegunn/fzf

# https://github.com/zsh-users/zsh-history-substring-search#usage
zinit wait"0b" lucid for \
  atinit"bindkey '^[[A' history-substring-search-up; bindkey '^[[B' history-substring-search-down" \
    zsh-users/zsh-history-substring-search

#alias vim="nvim"
alias gitp="git p"
