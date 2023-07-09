typeset -gU path fpath cdpath

path=(
  $path
  /usr/local/{bin,sbin}
  $HOME/bin
)

cdpath=(
  $HOME
  $HOME/src
  $cdpath
)
