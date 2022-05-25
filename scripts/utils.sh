#!/bin/bash

bold=$(tput bold)
underline=$(tput sgr 0 1)
reset=$(tput sgr0)


colorRed=$(tput setaf 1)
colorGreen=$(tput setaf 2)
colorYellow=$(tput setaf 3)
colorBlue=$(tput setaf 4)


e_header() { 
	printf "\n${bold}${colorBlue}==========  %s  ==========${reset}\n\n" "$@" 
}

e_footer() {
	printf "\n${bold}${colorBlue}==> %s \n\n" "$@"
}

e_error() {
  printf "${colorRed}❌ %s${reset}\n" "$@"
}

e_pending() {
  printf "${colorYellow}⏳  %s...${color_reset}\n" "$@"

}

e_success() {
  printf "${colorGreen}✔  %s${color_reset}\n" "$@"
}

has_command() {
  if [ $(type -P $1) ]; then
    return 0
  fi
  return 1
}

test_command() {
  if has_command $1; then
    e_success "$1"
  else
    e_failure "$1"
  fi
}

has_brew() {
  if $(brew ls --versions $1 > /dev/null); then
    return 0
  fi
  return 1
}

test_brew() {
  if has_brew $1; then
    e_success "$1"
  else
    e_failure "$1"
  fi
}

has_path() {
  local path="$@"
  if [ -e "$HOME/$path" ]; then
    return 0
  fi
  return 1
}

test_path() {
  # local path=$(echo "$@" | sed 's:.*/::')
  if has_path $1; then
    # e_success "$path"
    e_success "$1"
  else
    # e_failure "$path"
    e_failure "$1"
  fi
}

has_app() {
  local name="$@"
  if [ -e "/Applications/$name.app" ]; then
    return 0
  fi
  return 1
}

test_app() {
  if has_app $1; then
    e_success "$1"
  else
    e_failure "$1"
  fi
}

has_consent() {
  if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    return 0
  fi
  return 1
}

get_consent() {
  printf "❔  %s? [y/n]:" "$@"
  read -p " " -n 1
  printf "\n"
}

if ! [[ "${OSTYPE}" == "darwin"* ]]; then
  e_failure "Unsupported operating system (macOS only)"
  exit 1
fi