source utils.sh


e_header "Configure dev tools..."

if has_command "brew"; then
  if ! has_command "nvm"; then
    get_consent "Install nvm (Node via nvm)"
    if has_consent; then
      e_pending "Installing nvm"
      curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
      test_command "nvm"
    fi
  fi
fi

if has_command "brew"; then
  if ! has_command "yarn"; then
    get_consent "Install yarn"
    if has_consent; then
      e_pending "Installing yarn"
	  corepack enable
      test_command "yarn"
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



e_footer "Dev tool configuration done!"