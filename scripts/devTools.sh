source utils.sh


e_header "Configure dev tools..."

if has_command "brew"; then
  if ! has_command "git-flow"; then
    get_consent "Install git-flow"
    if has_consent; then
      e_pending "Installing git-flow"
      brew install git-flow
      test_command "git-flow"
    fi
  fi
fi

if has_command "brew"; then
  if ! has_command "nvm"; then
    get_consent "Install nvm (Node via nvm)"
    if has_consent; then
      e_pending "Installing nvm"
      curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
      export NVM_DIR="$HOME/.nvm"
      [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
      [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
      if test_command "nvm"; then
        nvm install --lts
      fi
    fi
  fi
fi

if has_command "brew"; then
    test_app "Insomnia"
    if ! has_app "Insomnia"; then
      get_consent "Install Insomnia.app"
      if has_consent; then
        e_pending "Installing Insomia"
        brew install insomnia
        test_app "Insomnia"
      fi
    fi
fi

if has_command "brew"; then
    test_app "Rectangle"
    if ! has_app "Rectangle"; then
      get_consent "Install Rectangle.app"
      if has_consent; then
        e_pending "Installing Rectangle"
        brew install rectangle
        test_app "Rectangle"
      fi
    fi
fi


if has_command "brew"; then
    test_app "Visual Studio Code"
    if ! has_app "Visual Studio Code"; then
      get_consent "Install Visual Studio Code.app"
      if has_consent; then
        e_pending "Installing Visual Studio Code"
        brew install visual-studio-code
        test_app "Visual Studio Code"
      fi
    fi
fi

if has_command "brew"; then
  test_brew "neovim"
  if ! has_brew "neovim"; then
    get_consent "Install neovim"
    if has_consent; then
      e_pending "Installing neovim"
      brew install neovim
      test_brew "neovim"
    fi
  
  fi
fi



e_footer "Dev tool configuration done!"