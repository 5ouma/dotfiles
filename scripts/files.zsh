makeSymlink() {
  while read -r pack; do
    local homeFile homeDir >/dev/null 2>&1
    homeFile="$2/$(echo "$pack" | sed -r "s/.*$(basename "$1")\/[^\/]*\///")"
    homeDir=$(dirname "$homeFile")
    if [[ -e "$homeFile" && -n $(diff "$pack" "$homeFile") ]]; then
      mkdir -p "$(dirname "$1")/backup"
      mv "$homeFile" "$(dirname "$1")/backup/"
    fi
    if [[ ! -e "$homeFile" || -n $(diff "$pack" "$homeFile") ]]; then
      mkdir -p "$homeDir"
      ln -sv "$pack" "$homeDir"
      notSetup=false
    fi
  done < <(find "$1" -type f ! -name ".DS_Store")
}

if $1 || "$doAll" || waitInput "Make symlinks or create terminal files." "$0"; then
  $1 || echoNumber "🔗 The following files and directories will be symlinked or created:"
  makeSymlink "$packages" "$HOME"
  mkdir -p "$HOME/.cache" "$HOME/.vim/undo" "$HOME/.ssh/git"
  touch "$HOME/.hushlogin"
  if ! "$notSetup"; then
    echoResult "Set these files!" "Setting files is failed."
    sleep 1
  else
    echoWarning "All files are already set."
    sleep 0.5
  fi
fi
