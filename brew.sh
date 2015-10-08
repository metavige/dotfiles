#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/screen
brew install homebrew/php/php55 --with-gmp

# Install shell
brew install zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
brew install fish
curl -L https://github.com/bpinto/oh-my-fish/raw/master/tools/install.sh | sh

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz

# install better console utils
brew install tmux
brew install mosh
brew install reattach-to-user-namespace #fix iterm2 copy/paster bug

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rhino
brew install tree
brew install webkit2png
brew install zopfli
brew install openssl

brew install git-tf

# Install Java Env
brew install maven
brew install ant
brew install groovy
brew install gradle

# Install Node.js. Note: this installs `npm` too, using the recommended
# installation method.
brew install eode
#brew install nvm
#source $(brew --prefix nvm)/nvm.sh 
#nvm install node && nvm alias default node

# Install Cask
brew install caskroom/cask/brew-cask

# Install Virtualbox from Cask
brew cask install virtualbox
brew cask install google-chrome
brew cask install firefox
brew cask install github
brew cask install sourcetree
brew cask install iterm2
brew cask install dropbox
brew cask install google-drive
brew cask install wallpaper-wizard
brew cask install evernote
brew cask install dash

# Remove outdated versions from the cellar.
brew cask cleanup
brew cleanup
