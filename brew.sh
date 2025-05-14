#!/usr/bin/env bash

# Source code is from https://github.com/mathiasbynens/dotfiles/blob/main/brew.sh @mathiasbynens
# Install Homebrew beforehand
brew update
brew upgrade

# Save Homebrew’s installed location..
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install `fish` and `oh-my-posh`.
brew install fish 
brew install jandedobbeleer/oh-my-posh/oh-my-posh

# Set fish as the default shell
echo ${BREW_PREFIX}/bin/fish | sudo tee -a /etc/shells
chsh -s ${BREW_PREFIX}/bin/fish

# Install `wget` with IRI support.
brew install wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install Helix
brew install helix

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
brew install openssh
brew install screen

# Install other useful binaries.
brew install git

# For Development
brew install deno
brew install oven-sh/bun/bun
brew install node
brew install zig
brew install go
brew install uv

# Install my preferred binaries.
brew install dust
brew install aria2
brew install bottom
brew install eza
brew install fastfetch
brew install mpv
brew install onefetch
brew install pandoc
brew install scrcpy
brew install sing-box
brew install typst
brew install yt-dlp

# Install `yazi` for terminal file manager
brew install yazi ffmpeg sevenzip jq poppler fd ripgrep fzf zoxide resvg imagemagick font-symbols-only-nerd-font

# Install macOS apps
brew install --cask bitwarden
brew install --cask input-source-pro
brew install --cask localsend
brew install --cask stats
brew install --cask deskflow
brew install --cask ghostty
brew install --cask jordanbaird-ice
brew install --cask pot

# Remove outdated versions from the cellar.
brew cleanup
