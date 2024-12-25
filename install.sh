#!/usr/bin/env sh

brew_install() {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

chezmoi_install() {
    brew install chezmoi
    
}

# Check arch
arch=$(uname -m)
if [ "$arch" = "x86_64" ]; then
    export BREWEXEC="/usr/local/bin/brew"
elif [ "$arch" = "arm64" ]; then
    export BREWEXEC="/opt/homebrew/bin/brew"
fi


if command -v brew > /dev/null; then
    echo "Brew package manager successfully installed"
else
    echo "Installing brew"
    brew_install
    # Generate shellenv for brew
    echo >> "$HOME"/.zprofile
    echo "eval '$($BREWEXEC shellenv)'" >> "$HOME"/.zprofile
    eval "$($BREWEXEC shellenv)"
fi

if command -v chezmoi > /dev/null; then
    echo "Chezmoi dotfile manager successfully installed"
else
    chezmoi_install
fi

