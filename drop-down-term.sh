#!/bin/bash

# Primarily used to replicate drop-down terminal behaviour like Guake
#
# After install perform these steps:
# * Set hotkey -> Preferences → Keys → Hotkey and check the Show/ hide all windows with a system-wide hotkey checbox and choose your hotkey combination.
# * Set display option -> Preferences → Profiles → Window tab and set Style to Full-Width Top of Screen and Screen to Screen with Cursor.
# * Exclude from Dock and Application switcher -> Preferences → Appearance and check the Exclude from Dock and ⌘-Tab Switcher.
# * Set to open on start-up -> System Preferences → Users and Groups. Then choose your user and go to Login Items tab. Add new item with [+] button and choose iTerm application from Applications folder
brew install iterm2 --cask
