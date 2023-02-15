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
