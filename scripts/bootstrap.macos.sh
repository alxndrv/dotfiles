#!/usr/bin/env bash

### File contents inspired by https://github.com/mathiasbynens/dotfiles/blob/main/.macos

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

###--------------------------------------------------###

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Mouse: disable acceleration and set pointer speed
defaults write NSGlobalDomain com.apple.mouse.linear -int 1
defaults write NSGlobalDomain com.apple.mouse.scaling -int 1

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Finder: new windows open Home directory instead of Recents
defaults write com.apple.Finder NewWindowTarget "PfHm"

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false

# Get rid of as much animation delay as possible
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.dock launchanim -bool false
defaults write -g NSWindowResizeTime -float 0.001
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock autohide-time-modifier -float 0
#defaults write com.apple.universalaccess reduceMotion -bool true
defaults write com.apple.Accessibility ReduceMotionEnabled -bool true

# Disable all hot-corners
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-br-corner -int 0
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tr-corner -int 0

# Set the icon size of Dock items to 28 pixels
defaults write com.apple.dock tilesize -int 28

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Don't show Recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Save screenshots in ~/Screenshots instead of on the Desktop
defaults write com.apple.screencapture location "~/Screenshots"

# Set key repeat rate
# ⚠️ This needs a restart... Or just change it in System Settings :(
defaults write NSGlobalDomain KeyRepeat -int 2

# Hide remaining battery time; show percentage
# ⚠️ This doesn't seem to do anything and seems to require a manual toggle in the menubar
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
defaults write com.apple.menuextra.battery ShowTime -string "NO"

# Show seconds in Clock
defaults write "com.apple.menuextra.clock" ShowSeconds -int 1

# Menubar, hide icons I don't care about
defaults write com.apple.controlcenter "NSStatusItem Visible FocusModes" -int 0
defaults write com.apple.controlcenter "NSStatusItem Visible KeyboardBrightness" -bool false
defaults write com.apple.Spotlight "NSStatusItem VisibleCC Item-0" -bool false

###--------------------------------------------------###

for app in "cfprefsd" \
  "Dock" \
  "Finder" \
  "ControlCenter" \
  "System Preferences" \
  "SystemUIServer"; do
  killall "${app}" &> /dev/null
done
