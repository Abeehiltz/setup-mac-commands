source utils.sh

e_header "Configure apps..."

if has_command "brew"; then
    test_app "Alfred"
    if ! has_app "Alfred 5"; then
      get_consent "Install Alfred.app"
      if has_consent; then
        e_pending "Installing Alfred"
        brew install alfred
        test_app "Alfred"
      fi
    fi
fi

if has_command "brew"; then
    test_app "AppCleaner"
    if ! has_app "Alfred"; then
      get_consent "Install Alfred.app"
      if has_consent; then
        e_pending "Installing Alfred"
        brew install alfred
        test_app "Alfred"
      fi
    fi
fi

if has_command "brew"; then
    test_app "Boop"
    if ! has_app "Boop"; then
      get_consent "Install Boop.app"
      if has_consent; then
        e_pending "Installing Boop"
        brew install boop
        test_app "Boop"
      fi
    fi
fi

e_footer "Apps configuration done!"