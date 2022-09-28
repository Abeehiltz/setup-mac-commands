source utils.sh


e_header "Configure terminal..."

if has_command "brew"; then
  if ! has_command "git"; then
    get_consent "Install git"
    if has_consent; then
      e_pending "Installing git"
      brew install git
      test_command "git"
    fi
  fi
fi

if has_command "brew"; then
    test_app "iTerm"
    if ! has_app "iTerm"; then
      get_consent "Install iTerm.app"
      if has_consent; then
        e_pending "Installing iTerm2"
        brew install iterm2
        test_app "iTerm"
      fi
    fi
fi

if has_command "brew"; then
  if ! has_command "zsh"; then
    get_consent "Install zsh"
    if has_consent; then
      e_pending "Installing zsh"
      brew install zsh
      test_command "zsh"
    fi
  fi
fi

if has_command "zsh"; then
  if ! has_path ".oh-my-zsh"; then
    get_consent "Install oh-my-zsh"
    if has_consent; then
      e_pending "Installing oh-my-zsh"
      sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
      test_path ".oh-my-zsh"
    fi
  fi
fi

if has_command "brew" && has_command "zsh"; then
  if ! has_brew "zsh-autosuggestions"; then
    get_consent "Install zsh-autosuggestions"
    if has_consent; then
      e_pending "Installing zsh-autosuggestions"
      brew install zsh-autosuggestions
      echo "# Fish shell-like fast/unobtrusive autosuggestions for Zsh." >> ~/.zshrc
      echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
      test_brew "zsh-autosuggestions"
    fi
  fi
fi

if has_command "brew" && has_command "zsh"; then
  if ! has_brew "zsh-syntax-highlighting"; then
    get_consent "Install zsh-syntax-highlighting"
    if has_consent; then
      e_pending "Installing zsh-syntax-highlighting"
      brew install zsh-syntax-highlighting
      echo "# Fish shell-like syntax highlighting for Zsh." >> ~/.zshrc
      echo "# Warning: Must be last sourced!" >> ~/.zshrc
      echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
      test_brew "zsh-syntax-highlighting"
    fi
  fi
fi



if has_command "brew"; then
  if ! has_command "starship"; then
    get_consent "Install starship"
    if has_consent; then
      e_pending "Installing starship"
	  brew install starship
	  brew tap homebrew/cask-fonts && brew install --cask font-fira-code-nerd-font
      test_command "starship"
          mkdir -p ~/.config
	  cp ../configs/starship.toml ~/.config/starship.toml
	  echo 'export STARSHIP_CONFIG=~/.config/starship.toml' >> ~/.zshrc
	  echo 'eval "$(starship init zsh)"' >> ~/.zshrc
    fi
  fi
fi

e_footer "Terminal configuration done!"