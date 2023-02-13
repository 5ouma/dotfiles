#!/usr/bin/env zsh

if "$doAll" || waitInput "Make symlinks or create terminal files." "$0"; then
  echoNumber "🔗 The following files and directories will be symlinked or created:"
    setFiles
fi
