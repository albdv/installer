#!/usr/bin/env sh

brew_install() {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

brew_env() {
    # Generate shellenv for brew
    echo >> "$HOME"/.zprofile
    echo "eval '$($BREWPREFIX/brew shellenv)'" >> "$HOME"/.zprofile
    eval "$($BREWPREFIX/brew shellenv)"

}

chezmoi_install() {
    "$BREWPREFIX"/brew install chezmoi
    
}

# Check arch
arch=$(uname -m)
if [ "$arch" = "x86_64" ]; then
    BREWPREFIX="/usr/local/bin/"
elif [ "$arch" = "arm64" ]; then
    BREWPREFIX="/opt/homebrew/bin/"
fi


if command -v brew > /dev/null; then
    echo "Brew package manager successfully installed"
else
    echo "Installing brew"
    brew_install
    if [ ! "${PATH##*"$BREWPREFIX"*}" ]; then
        echo "Add brew to PATH if it's not there"
        brew_env
    fi
fi

if command -v chezmoi > /dev/null; then
    echo "Chezmoi dotfile manager successfully installed"
else
    chezmoi_install
fi

