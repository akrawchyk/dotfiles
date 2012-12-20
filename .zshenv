# use GNU coreutils and set /usr/local/bin before /usr/bin for homebrew
typeset -U path
path=($(brew --prefix coreutils)/libexec/gnubin \
      /usr/local/bin \
      /usr/local/sbin \
      $path \
      ~/.rvm/bin \
      /usr/local/share/npm/bin \
      ~/.cabal/bin)

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
