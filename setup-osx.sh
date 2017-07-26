#!/bin/sh

LIB=$HOME/Library
APP_SUPPORT=$LIB/Application\ Support

# Current directory
CWD=`pwd`

if [ ! -d /Applications/Xcode.app ]; then
  echo "Install Xcode from the App Store first."
  exit 1
fi

# check that [brew](http://mxcl.github.com/homebrew/) is installed.
if [ ! -e /usr/local/bin/brew ]; then
  echo "Instal homebrew first:"
  echo "/usr/bin/ruby -e \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\""
  exit 1
fi


#################################################################
# Install tools
#################################################################

## SOURCE CODE CONTROL ##

# install [git](http://git-scm.com/)
if [ ! -e /usr/local/bin/git ]; then
  echo "Installing git..."
  brew install git git-flow git-extras git-lfs
fi
# install [hg](https://www.mercurial-scm.org/)
if [ ! -e /usr/local/bin/hg ]; then
  echo "Installing mercurial..."
  brew install mercurial
fi
# install [bazaar](http://bazaar.canonical.com/en/)
if [ ! -e /usr/local/bin/bzr ]; then
  echo "Installing bazaar..."
  brew install bazaar
fi


## APPLICATIONS ##

# install [atom](https://atom.io/)
if [ ! -e /Applications/Atom.app ]; then
  echo "Installing atom..."
  brew cask install atom
  apm install language-protobuf language-latex language-docker
  apm install linter linter-eslint linter-js-yaml linter-protocol-buffer linter-shellcheck linter-docker
  apm install go-plus
  apm install react
  apm install unity-ui nucleus-dark-ui
fi

# install [iterm2](https://iterm2.com/)
if [ ! -d /Applications/iTerm.app ]; then
  echo "Installing iTerm2..."
  brew cask install iterm2
fi

# install [1password](https://1password.com/)
if [ ! -d "/Applications/1Password 6.app" ]; then
  echo "Installing 1Password..."
  brew cask install 1password
fi

# install [alfred](https://www.alfredapp.com/)
if [ ! -d "/Applications/Alfred 3.app" ]; then
  echo "Installing alfred..."
  brew cask install alfred
fi

# install [vmware](https://www.vmware.com/products/fusion.html)
if [ ! -d "/Applications/VMware Fusion.app" ]; then
  echo "Installing vmware..."
  brew cask install vmware-fusion
fi

# install [slack](https://slack.com/)
if [ ! -d /Applications/Slack.app ]; then
  echo "Installing Slack..."
  brew cask install slack
fi

# install [dropbox](https://dropbox.com/)
if [ ! -d /Applications/Dropbox.app ]; then
  echo "Installing Dropbox..."
  brew cask install dropbox
fi

# install [revisions](https://revisionsapp.com/) - for dropbox
if [ ! -d /Applications/Revisions.app ]; then
  echo "Installing Revisions for Dropbox..."
  brew cask install revisions
fi

# install [cloud](https://www.getcloudapp.com/)
if [ ! -d /Applications/CloudApp.app ]; then
  echo "Installing CloudApp..."
  brew cask install cloudapp
fi

# install [ubersicht](http://tracesof.net/uebersicht/)
if [ ! -d /Applications/Übersicht.app ]; then
  echo "Installing Übersicht..."
  brew cask install ubersicht
fi

# install [go2shell](http://zipzapmac.com/Go2Shell)
if [ ! -d /Applications/Go2Shell.app ]; then
  echo "Installing Go2Shell..."
  brew cask install go2shell
fi

# install [moom](https://manytricks.com/moom/)
if [ ! -d /Applications/Moom.app ]; then
  echo "Installing Moom..."
  brew cask install moom
fi

# install [the unarchiver](http://unarchiver.c3.cx/unarchiver)
if [ ! -d "/Applications/The Unarchiver.app" ]; then
  echo "Installing The Unarchiver..."
  brew cask install the-unarchiver
fi

# install [spotify](https://spotify.com/)
if [ ! -d /Applications/Spotify.app ]; then
  echo "Installing Spotify..."
  brew cask install spotify
fi

# install [omniplan](https://www.omnigroup.com/omniplan)
if [ ! -d /Applications/OmniPlan.app ]; then
  echo "Installing OmniPlan..."
  brew cask install omniplan
fi

# install [omnigraffle](https://omnigraffle.com/)
if [ ! -d /Applications/OmniGraffle.app ]; then
  echo "Installing OmniGraffle..."
  brew cask install omnigraffle
fi

# install [chrome](https://www.google.com/chrome/browser/desktop/index.html)
if [ ! -d "/Applications/Google Chrome.app" ]; then
  echo "Installing Google Chrome..."
  brew cask install google-chrome
fi

# install [firefox](https://www.mozilla.org/firefox/)
if [ ! -d /Applications/Firefox.app ]; then
  echo "Installing Firefox..."
  brew cask install firefox
fi

# install [papers](http://papersapp.com/)
if [ ! -d /Applications/Papers.app ]; then
  echo "Installing Papers.app..."
  brew cask install papers
fi

# install [dash](https://kapeli.com/dash)
if [ ! -d /Applications/Dash.app ]; then
  echo "Installing Dash..."
  brew cask install dash
fi

# install [capto](http://www.globaldelight.com/capto/)
if [ ! -d /Applications/Capto.app ]; then
  echo "Installing Capto..."
  brew cask install capto
fi

# install [MeisterTask](https://www.meistertask.com/)
if [ -d /Applications/MeisterTask.app ]; then
  echo "Installing MeisterTask..."
  curl -sL -o /tmp/MeisterTask.pkg https://www.meistertask.com/files/MeisterTask_osx.pkg
  sudo /usr/sbin/installer -pkg /tmp/MeisterTask.pkg -target /
fi


## COMMAND LINE TOOLS ##

# install [zsh](http://www.zsh.org/)
if [ ! -e /usr/local/bin/zsh ]; then
  echo "Installing zsh and setting to a default shell..."
  brew install zsh
  chsh -s /usr/local/bin/zsh
fi

# install [corkscrew](http://agroman.net/corkscrew/)
if [ ! -e /usr/local/bin/corkscrew ]; then
  echo "Installing corkscrew..."
  brew install corkscrew
fi

# install [armor](https://armor.labstack.com/)
if [ ! -e /usr/local/bin/armor ]; then
  echo "Installing armor..."
  brew install armor
fi

# install [fzf](https://github.com/junegunn/fzf) fuzzy search
if [ ! -e /usr/local/bin/fzf ]; then
  echo "Installing fzf..."
  brew install fzf
fi

# install [silver searcher](http://geoff.greer.fm/ag/) grep replacement
if [ ! -e /usr/local/bin/ag ]; then
  echo "Installing ag..."
  brew install the_silver_searcher
fi

# install [httpie](https://httpie.org/) curl replacement
if [ ! -e /usr/local/bin/http ]; then
  echo "Installing httpie..."
  brew install httpie
fi

# install [htop](https://hisham.hm/htop/) top replacement
if [ ! -e /usr/local/bin/htop ]; then
  echo "Installing htop..."
  brew install htop
fi

# install [jq](https://stedolan.github.io/jq/)
if [ ! -e /usr/local/bin/jq ]; then
  echo "Installing jq..."
  brew install jq
fi

# install [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy/)
if [ ! -e /usr/local/bin/diff-so-fancy ]; then
  echo "Installing diff-so-fancy..."
  brew install diff-so-fancy
fi

# install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
if [ ! -d $HOME/.oh-my-zsh ]; then
  echo "Installing oh-my-zsh..."
  curl -L http://install.ohmyz.sh | sh
  cd $HOME/.oh-my-zsh/custom/plugins
  git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
  git clone git://github.com/zsh-users/zsh-history-substring-search.git
fi

# install [antigen](http://antigen.sharats.me/) zsh plugin manager
if [ ! -f /usr/local/share/antigen/antigen.zsh ]; then
  echo "Installing antigen..."
  brew install antigen
  source /usr/local/share/antigen/antigen.zsh
fi

# Install [qfc](https://github.com/pindexis/qfc) file completion
if [ ! -e $HOME/.qfc ]; then
  echo "Installing qfc..."
  git clone https://github.com/pindexis/qfc $HOME/.qfc
fi

# Install [marker](https://github.com/pindexis/marker) command palette
export MARKER_KEY_MARK='\C-0'
if [ ! -e $HOME/.marker ]; then
  echo "Installing marker..."
  git clone https://github.com/pindexis/marker $HOME/.marker
  $HOME/.marker/install.py
fi

# install [z](https://github.com/rupa/z) directory tracking
if [ ! -e /usr/local/etc/profile.d/z.sh ]; then
  echo "Installing z..."
  brew install z
fi

# install [trash](http://hasseg.org/trash/) alternative to rm
if [ ! -e /usr/local/bin/trash ]; then
  echo "Installing trash..."
  brew install trash
fi


## GOLANG ##

# install [go](http://golang.org/)
if [ ! -e /usr/local/bin/go ]; then
  echo "Installing go..."
  brew install go
fi
mkdir -p $HOME/dev/go
export GOPATH=$HOME/dev/go

if [ ! -x $GOPATH/bin/goimports ]; then
  echo "Installing goimports..."
  go get golang.org/x/tools/cmd/goimports
fi
if [ ! -x $GOPATH/bin/gotype ]; then
  echo "Installing gotype..."
  go get golang.org/x/tools/cmd/gotype
fi
if [ ! -x $GOPATH/bin/gorename ]; then
  echo "Installing gorename..."
  go get golang.org/x/tools/cmd/gorename
fi
if [ ! -x $GOPATH/bin/cover ]; then
  echo "Installing cover..."
  go get golang.org/x/tools/cmd/cover
fi
if [ ! -x $GOPATH/bin/benchcmp ]; then
  echo "Installing benchcmp..."
  go get golang.org/x/tools/cmd/benchcmp
fi

if [ ! -x $GOPATH/bin/realize ]; then
  echo "Installing realize build server..."
  go get github.com/tockins/realize
fi
if [ ! -x $GOPATH/bin/devd ]; then
  echo "Installing devd webserver..."
  go get github.com/cortesi/devd/cmd/devd
fi
if [ ! -x $GOPATH/bin/modd ]; then
  echo "Installing modd tool..."
  go get github.com/cortesi/modd/cmd/modd
fi
if [ ! -x $GOPATH/bin/govendor ]; then
  echo "Installing govendor..."
  go get github.com/kardianos/govendor
fi
if [ ! -x $GOPATH/bin/expvarmon ]; then
  echo "Installing expvarmon..."
  go get github.com/divan/expvarmon
fi
if [ ! -x $GOPATH/bin/binstale ]; then
  echo "Installing binstale..."
  go get github.com/shurcooL/binstale
fi


## NODE.JS ##

# install [node](http://nodejs.org/)
if [ ! -e /usr/local/bin/node ]; then
  echo "Installing node.js..."
  brew install node
fi

## RUBY ##

# install [ruby](https://www.ruby-lang.org/en/)
if [ ! -e /usr/local/bin/ruby ]; then
  brew install ruby
fi

# install [i2cssh](https://github.com/wouterdebie/i2cssh)
which i2cssh > /dev/null
if [ $? -eq 1 ]; then
  gem install i2cssh
fi

# install [jekyll](https://jekyllrb.com/)
which jekyll > /dev/null
if [ $? -eq 1 ]; then
  gem install jekyll bundler
fi


## DEVOPS TOOLS ##

# install [packer](https://www.packer.io/)
if [ ! -e /usr/local/bin/packer ]; then
  echo "Installing packer..."
  brew install packer
fi

# install [docker](https://www.docker.com/)
if [ ! -e /Applications/Docker.app ]; then
  echo "Installing docker..."
  curl -o /tmp/Docker.dmg https://download.docker.com/mac/stable/Docker.dmg
  open /tmp/Docker.dmg
  cp /Volumes/Docker/Docker.app /Applications/
  diskutil unmount /Volumes/Docker
  open /Applications/Docker.app
fi


## DEV DEPENDENCIES ##

# install elasticsearch
if [ ! -e /usr/local/bin/elasticsearch ]; then
  echo "Installing elasticsearch..."
  brew install elasticsearch
fi

# install kibana
if [ ! -e /usr/local/bin/kibana ]; then
  echo "Installing kibana..."
  brew install kibana
fi

# install gnatsd
if [ ! -e /usr/local/bin/gnatsd ]; then
  echo "Installing gnatsd..."
  brew install gnatsd
fi

# install rabbitmq
if [ ! -e /usr/local/sbin/rabbitmq-server ]; then
  echo "Installing rabbitmq..."
  brew install rabbitmq
fi

# install redis
if [ ! -e /usr/local/bin/redis-server ]; then
  echo "Installing redis..."
  brew install redis
fi

# install protobuf
if [ ! -e /usr/local/bin/protoc ]; then
  echo "Installing protobuf..."
  brew install protobuf
fi

# install nanomsg
if [ ! -e /usr/local/bin/nanocat ]; then
  echo "Installing nanomsg..."
  brew install nanomsg
fi

# install kafka
if [ ! -e /usr/local/bin/kafka-server-start ]; then
  echo "Installing kafka..."
  brew install kafka
fi

# install prometheus
if [ ! -e /usr/local/bin/prometheus ]; then
  echo "Installing prometheus..."
  brew install prometheus
fi


#################################################################
# Copy dot files/dirs from here into home directory
#################################################################

echo "Copying dot files..."
for i in `command ls -Ad dotfiles/.[A-Za-z]*` ; do
  cp -f $i $HOME
done


#################################################################
# Application Configurations
#################################################################

# [Marked](http://markedapp.com/)
MARKED_DIR=$APP_SUPPORT/Marked
echo "Copying Marked.app custom styles..."
if [ -d "$MARKED_DIR" ]; then
  if [ ! -d "$MARKED_DIR/Custom CSS" ]; then
    mkdir -p "$MARKED_DIR/Custom CSS"
  fi
  cd "$MARKED_DIR/Custom CSS" && curl --silent --location https://raw.github.com/moritzz/Writer-CSS/master/iA%20Writer.css --output iA\ Writer.css && cd $CWD
  cd "$MARKED_DIR/Custom CSS" && curl --silent --location -O https://raw.github.com/jgoodall/markedapp-solarized/master/Marked-Solarized.css && cd $CWD
fi


#################################################################
# System Configurations
#################################################################

# colors
echo "Copying Color Palettes..."
cd $LIB/Colors && curl -O --silent --location https://github.com/altercation/solarized/raw/master/apple-colorpalette-solarized/solarized.clr && cd $CWD

# quicklook
echo "Installing QuickLook plugins..."
brew cask install qlmarkdown qlstephen qlcolorcode quicklook-json quicklook-csv betterzipql ttscoff-mmd-quicklook
qlmanage -r

# services
echo "Copying System Services..."
cp -rf $CWD/mac/Services/* $LIB/Services/


#################################################################
# System Fonts
# Get fonts from http://www.fontsquirrel.com/fonts/
#################################################################

echo "Installing Fonts..."
cd $LIB/Fonts
if [ ! -f FiraCode-Regular.ttf ]; then
  command curl -sOL https://github.com/tonsky/FiraCode/releases/download/1.204/FiraCode_1.204.zip && unzip -o FiraCode_1.204.zip "ttf/*ttf" && mv ttf/* . && rm FiraCode_1.204.zip && rmdir ttf
fi
if [ ! -f Anonymous_Pro.ttf ]; then
  command curl -sOL http://www.fontsquirrel.com/fonts/download/Anonymous-Pro && unzip -o Anonymous-Pro && rm Anonymous-Pro
fi
if [ ! -f Inconsolata.otf ]; then
  command curl -sOL http://www.fontsquirrel.com/fonts/download/Inconsolata && unzip -o Inconsolata && rm Inconsolata
fi
if [ ! -f SourceCodePro-Regular.otf ]; then
  command curl -sOL http://www.fontsquirrel.com/fonts/download/source-code-pro && unzip -o source-code-pro && rm source-code-pro
fi
if [ ! -f ArchitectsDaughter.ttf ]; then
  command curl -sOL http://www.fontsquirrel.com/fonts/download/architects-daughter && unzip -o architects-daughter && rm architects-daughter
fi
if [ ! -f Daniel-Regular.otf ]; then
  command curl -sOL http://www.fontsquirrel.com/fonts/download/Daniel && unzip -o Daniel && rm Daniel
fi
mv *.txt ~/.Trash/
cd $CWD


#################################################################
# Set up OS X defaults
#################################################################

echo "Setting up system defaults..."

# be quiet on login
touch ~/.hushlogin

echo "Disable Spotlight indexing for any volume that gets mounted and has not yet been indexed before."
defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array "/Volumes"

echo "Menu bar: disable transparency"
defaults write com.apple.universalaccess reduceTransparency -bool true

echo "Hide Time Machine, Volume, User menu icons"
for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
  defaults write "${domain}" dontAutoLoad -array \
    "/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
    "/System/Library/CoreServices/Menu Extras/Volume.menu" \
    "/System/Library/CoreServices/Menu Extras/User.menu"
done

echo "Hide battery and clock menu icons"
defaults write com.apple.systemuiserver menuExtras -array  "/System/Library/CoreServices/Menu Extras/Battery.menu" "/System/Library/CoreServices/Menu Extras/Clock.menu"

echo "Always show scrollbars"
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

echo "Increase window resize speed for Cocoa applications"
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

echo "Expanding the save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

echo "Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

echo "Check for software updates daily, not just once per week"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

echo "Disable smart quotes and smart dashes?"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

echo "Disable Photos.app from starting everytime a device is plugged in"
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

echo "Removing duplicates in the 'Open With' menu"
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

echo "Disable the “Are you sure you want to open this application?” dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo "Set Help Viewer windows to non-floating mode"
defaults write com.apple.helpviewer DevMode -bool true


#################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input   #
#################################################################

echo "Enabling tap to click for this user and for the login screen"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

echo "Enabling full keyboard access for all controls (enable Tab in modal dialogs, menu windows, etc.)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo "Disabling press-and-hold for special keys in favor of key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

echo "Setting a blazingly fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 0

echo "Setting trackpad & mouse speed to a reasonable number"
defaults write -g com.apple.trackpad.scaling 2
defaults write -g com.apple.mouse.scaling 2.5

echo "Turn off keyboard illumination when computer is not used for 5 minutes"
defaults write com.apple.BezelServices kDimTime -int 300

echo "Increasing sound quality for Bluetooth headphones/headsets"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40


#################################################################
# Screen                                                        #
#################################################################

echo "Require password immediately after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

echo "Save screenshots to the desktop"
defaults write com.apple.screencapture location -string "$HOME/Desktop"

echo "Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)"
defaults write com.apple.screencapture type -string "png"

echo "Enabling subpixel font rendering on non-Apple LCDs"
defaults write NSGlobalDomain AppleFontSmoothing -int 2


#################################################################
# Finder                                                        #
#################################################################

# Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true

# Finder: disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Use column view in all Finder windows by default
# Four-letter codes for the  view modes: `icnv`, `clmv`, `Flwv`, `Nlsv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Show the ~/Library folder
chflags nohidden ~/Library


#################################################################
# Dock                                                          #
#################################################################

# Enable highlight hover effect for the grid view of a stack (Dock)
defaults write com.apple.dock mouse-over-hilte-stack -bool true

# Set the icon size of Dock items to 32 pixels
defaults write com.apple.dock tilesize -int 32

# Enable spring loading for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Don't animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Remove the auto-hiding Dock delay
defaults write com.apple.Dock autohide-delay -float 0
# Remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0

# Enable the 2D Dock
defaults write com.apple.dock no-glass -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Reset Launchpad
find ~/Library/Application\ Support/Dock -name "*.db" -maxdepth 1 -delete

# Hot corners
# Top left screen corner → Mission Control
defaults write com.apple.dock wvous-tl-corner -int 2
defaults write com.apple.dock wvous-tl-modifier -int 0
# Top right screen corner → Desktop
defaults write com.apple.dock wvous-tr-corner -int 4
defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom left screen corner → Start screen saver
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0


#################################################################
# Safari/webkit                                                 #
#################################################################

# Hide Safari’s bookmarks bar by default
defaults write com.apple.Safari ShowFavoritesBar -bool false

# Disable Safari's thumbnail cache for History and Top Sites
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

# Enable Safari's debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Make Safari’s search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Remove useless icons from Safari’s bookmarks bar
defaults write com.apple.Safari ProxiesInBookmarksBar "()"

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true


#################################################################
# Dashboard                                                     #
#################################################################

# Turn the dashboard off completely
defaults write com.apple.dashboard mcx-disabled -bool true

# Don’t show Dashboard as a Space
defaults write com.apple.dock "dashboard-in-overlay" -bool true


#################################################################
# iTunes                                                        #
#################################################################

# Make the iTunes arrow links go to your library instead of the iTunes Store
defaults write com.apple.iTunes invertStoreLinks -bool true

# Disable the iTunes arrow links completely
defaults write com.apple.iTunes show-store-arrow-links -bool false

# Disable the Ping sidebar in iTunes
defaults write com.apple.iTunes disablePingSidebar -bool true

# Disable all the other Ping stuff in iTunes
defaults write com.apple.iTunes disablePing -bool true


#################################################################
# Mail                                                          #
#################################################################

# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false


#################################################################
# Time Machine                                                  #
#################################################################

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true


#################################################################
# Google Chrome & Google Chrome Canary                          #
#################################################################

# Allow installing user scripts via GitHub or Userscripts.org
defaults write com.google.Chrome ExtensionInstallSources -array "https://*.github.com/*" "http://userscripts.org/*"
defaults write com.google.Chrome.canary ExtensionInstallSources -array "https://*.github.com/*" "http://userscripts.org/*"


#################################################################
# Twitter.app                                                   #
#################################################################

# Disable smart quotes as it’s annoying for code tweets
defaults write com.twitter.twitter-mac AutomaticQuoteSubstitutionEnabled -bool false

# Show the app window when clicking the menu icon
defaults write com.twitter.twitter-mac MenuItemBehavior -int 1

# Enable the hidden ‘Develop’ menu
defaults write com.twitter.twitter-mac ShowDevelopMenu -bool true

# Open links in the background
defaults write com.twitter.twitter-mac openLinksInBackground -bool true

# Allow closing the ‘new tweet’ window by pressing `Esc`
defaults write com.twitter.twitter-mac ESCClosesComposeWindow -bool true

# Show full names rather than Twitter handles
#defaults write com.twitter.twitter-mac ShowFullNames -bool true

# Hide the app in the background if it’s not the front-most window
defaults write com.twitter.twitter-mac HideInBackground -bool true

# Reset the affected apps
for app in Finder Dock Mail Safari iTunes SystemUIServer Twitter; do
  killall "$app" > /dev/null 2>&1
done

# Enable access for assistive devices
echo 'Requesting password to enable access for assistive devices'
echo -n 'a' | sudo tee /private/var/db/.AccessibilityAPIEnabled > /dev/null 2>&1
sudo chmod 444 /private/var/db/.AccessibilityAPIEnabled

echo "Disable Spotlight on backup drive"
sudo mdutil -i off "/Volumes/mybook"

echo "Speeding up wake from sleep to 24 hours from an hour"
# http://www.cultofmac.com/221392/quick-hack-speeds-up-retina-macbooks-wake-from-sleep-os-x-tips/
sudo pmset -a standbydelay 86400

cd $CWD

echo ""
echo "Install Mac Apps (Pages, Numbers, and Keynote) via the App Store."
echo "Install Marked, Pocket, Screeny, and IA Writer via the App Store."
