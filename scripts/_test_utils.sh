#!/bin/bash

source utils.sh

e_header "Test header"


e_error "test error"
e_pending "test pending"
e_success "test success"

e_pending "Checking test_command"
test_command "ls"

e_pending "Checking test_brew"
test_brew "python"

e_pending "Checking test_path"
test_path "Downloads"

e_pending "Checking test_app"
test_app "Safari"

e_pending "Testing user input"
get_consent "get_consent"
if has_consent; then
  e_success "has_consent"
else
  e_error "has_consent"
fi


e_footer "Tests complete"
