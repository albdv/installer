#!/usr/bin/env sh

brew_install() {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

chezmoi_install() {
    brew install chezmoi
    
}

if command -v brew > /dev/null; then
    echo "Brew package manager successfully installed"
else
    echo "Installing brew"
    brew_install
fi

if command -v chezmoi > /dev/null; then
    echo "Chezmoi dotfile manager successfully installed"
else
    chezmoi_install
fi

