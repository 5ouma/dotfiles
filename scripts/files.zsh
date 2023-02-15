if $1 || "$doAll" || waitInput "Set files and directories." "$0"; then
  mkdir -p "$HOME/.cache" "$HOME/.vim/undo" "$HOME/.ssh/git"
  touch "$HOME/.hushlogin"

  $1 || echoNumber "🔗" "Symlinking files..." && {
    local notSetup=true
    while read -r pack; do
      local file >/dev/null 2>&1
      file="$HOME/${pack#"$packages"/*/}"
      if [[ -e "$file" && -n $(diff "$pack" "$file") ]]; then
        mkdir -p "$backup" && mv "$file" "$backup/"
      fi
      if [[ ! -e "$file" ]]; then
        mkdir -p "$(dirname "$file")" && ln -s "$pack" "$file"
        print -- "- $(printc cyan false "~${file#~}")"
        notSetup=false
      fi
    done < <(find "$packages" -type f ! -name ".DS_Store")

    if ! "$notSetup"; then
      echoResult "Symlinked these files!" "Symlinking files has failed."
    else
      echoWarning "All files are already symlinked."
    fi
  }
fi
