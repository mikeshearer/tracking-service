#!/bin/bash

#### Setting up npmrc ####
echo ">>>> Provide your Artifactory details"
read -rsp 'Artifactory API Key: ' artifactoryAPIKey
echo ''

npm config set always-auth true
npm set //hqo.jfrog.io/artifactory/api/npm/npm/:_authToken "$artifactoryAPIKey"

#### Ask for User info for git config
echo '>>>> Provide your User info'
read -rp 'Full Name (First Last): ' fullname
read -rp 'Email Address: ' email

git config --global user.name "$fullname"
git config --global user.email "$email"

#### Install Homebrew ####
if ! brew_loc="$(type -p "brew")" || [[ -z $brew_loc ]]; then
  echo ">>>> Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

read -rep 'Would you like to enable brew autoupdate (recommended): ' autoupdate
if [[ $autoupdate == 'yes' ]] || [[ $autoupdate == 'y' ]]; then
  brew autoupdate delete >/dev/null 2>&1
  brew autoupdate start --immediate --cleanup
  echo brew autoupdate has been enabled, you can disable this by running 'brew autoupdate delete'
fi

#### Install items in Brewfile ####
echo ">>>> Installing tools"
brew bundle install --no-lock --file Brewfile

#### Install asdf ####
echo ">>>> Installing asdf plugins and tool versions"
asdf plugin add python

#### Install tools from .tool-versions ####
asdf install

#### setup legacy mode
echo legacy_version_file = yes >"$HOME/.asdfrc"

#### Setup pre-commit
echo ">>>> Setting up pre-commit"
git config --global url."git@github.com:".insteadOf "https://github.com/"
git config --global init.templateDir ~/.git-template
pre-commit init-templatedir -t pre-commit -t prepare-commit-msg ~/.git-template
pre-commit install --install-hooks --allow-missing-config -t pre-commit -t prepare-commit-msg -f
