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
      echo ""  >>~/.zshrc
      echo "# Fish shell-like fast/unobtrusive autosuggestions for Zsh." >>~/.zshrc
      echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >>~/.zshrc
      echo ""  >>~/.zshrc
      test_brew "zsh-autosuggestions"
    fi
  fi
fi

if has_command "brew"; then
  get_consent "Install Firacode nerd font"
  if has_consent; then
    e_pending "Installing font..."
    brew tap homebrew/cask-fonts && brew install --cask font-fira-code-nerd-font
  fi
fi


if has_command "brew"; then
  get_consent "Install powerlevel10k"
  if has_consent; then
    e_pending "Installing powerlevel 10k..."
    brew install powerlevel10k
    echo "source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc
    echo "" >>~/.zshrc
    test_brew "powerlevel10k"
    echo "run p10k configure in iTerm later!"
  fi
fi




# No longer using Starship
# if has_command "brew"; then
#   if ! has_command "starship"; then
#     get_consent "Install starship"
#     if has_consent; then
#       e_pending "Installing starship"
#       brew install starship
#       test_command "starship"
#       mkdir -p ~/.config
#       cp ../configs/starship.toml ~/.config/starship.toml
#       echo 'export STARSHIP_CONFIG=~/.config/starship.toml' >>~/.zshrc
#       echo 'eval "$(starship init zsh)"' >>~/.zshrc
#     fi
#   fi
# fi

e_footer "Terminal configuration done!"
