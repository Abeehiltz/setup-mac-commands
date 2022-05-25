#!/bin/bash

source utils.sh


e_header "Initialisation..."

# Auto hide dock
get_consent "Autohide Dock"
if has_consent; then
  e_pending "Autohiding Dock..."
  defaults write com.apple.dock autohide -boolean true
  killall Dock
fi

get_consent "Hide Dock faster"
if has_consent; then
  e_pending "Hiding dock faster..."
  defaults write com.apple.dock autohide-delay -float 0.25
  killall Dock
fi

# Install xcode cli
if ! has_command "xcode-select"; then
  e_pending "Installing xcode-select..."
  xcode-select --install
  test_command "xcode-select"
fi

# Install brew
if ! has_command "brew"; then
  e_pending "Installing brew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew doctor
  test_command "brew"
fi


e_footer "Initialisation complete"
