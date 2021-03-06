#!/bin/sh

LIB=$HOME/Library
APP_SUPPORT=$LIB/Application\ Support

# Current directory
CWD=`pwd`

if [ ! -d /Applications/Xcode.app ]; then
  echo "Install [Xcode](https://developer.apple.com/xcode/) from the App Store first."
  exit 1
fi

# check that [brew](http://mxcl.github.com/homebrew/) is installed.
if [ ! -e /usr/local/bin/brew ]; then
  echo "Instal [homebrew](https://brew.sh/) first:"
  echo "  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)""
  exit 1
fi


#################################################################
# Install tools
#################################################################

## SOURCE CODE CONTROL ##

# install [git](http://git-scm.com/)
if [ ! -e /usr/local/bin/git ]; then
  echo "Installing git..."
  brew install -q git git-flow-avh git-extras git-lfs
fi
# install [hg](https://www.mercurial-scm.org/)
if [ ! -e /usr/local/bin/hg ]; then
  echo "Installing mercurial..."
  brew install -q mercurial
fi
# install [bazaar](http://bazaar.canonical.com/en/)
if [ ! -e /usr/local/bin/bzr ]; then
  echo "Installing bazaar..."
  brew install -q bazaar
fi


## APPLICATIONS ##

# install [VS Code](https://code.visualstudio.com/)
if [ ! -d "/Applications/Visual Studio Code.app" ]; then
  echo "Installing VS Code..."
  brew install -q --cask visual-studio-code
fi

# install [iterm2](https://iterm2.com/)
if [ ! -d /Applications/iTerm.app ]; then
  echo "Installing iTerm2..."
  brew install -q --cask iterm2
fi

# install [Hey](https://hey.com/)
if [ ! -d /Applications/HEY.app ]; then
  echo "Installing Hey..."
  brew install -q --cask hey
fi

# install [1password](https://1password.com/)
if [ ! -d "/Applications/1Password 7.app" ]; then
  echo "Installing 1Password..."
  brew install -q --cask 1password
fi

# install [alfred](https://www.alfredapp.com/)
if [ ! -d "/Applications/Alfred 4.app" ]; then
  echo "Installing alfred..."
  brew install -q --cask alfred
fi

# install [iina](https://iina.io/)
if [ ! -d "/Applications/IINA.app" ]; then
  echo "Installing iina..."
  brew install -q --cask iina
fi

# install [vmware](https://www.vmware.com/products/fusion.html)
if [ ! -d "/Applications/VMware Fusion.app" ]; then
  echo "Installing vmware..."
  brew install -q --cask vmware-fusion
fi

# install [slack](https://slack.com/)
if [ ! -d /Applications/Slack.app ]; then
  echo "Installing Slack..."
  brew install -q --cask slack
fi

# install [dropbox](https://dropbox.com/)
if [ ! -d /Applications/Dropbox.app ]; then
  echo "Installing Dropbox..."
  brew install -q --cask dropbox
fi

# install [ubersicht](http://tracesof.net/uebersicht/)
if [ ! -d /Applications/Übersicht.app ]; then
  echo "Installing Übersicht..."
  brew install -q --cask ubersicht
fi

# install [TypeIt4Me](http://www.ettoresoftware.com/mac-apps/typeit4me/)
if [ ! -d /Applications/TypeIt4Me.app ]; then
  echo "Installing TypeIt4Me..."
  brew install -q --cask typeit4me
fi

# install [go2shell](http://zipzapmac.com/Go2Shell)
if [ ! -d /Applications/Go2Shell.app ]; then
  echo "Installing Go2Shell..."
  brew install -q --cask go2shell
fi

# install [moom](https://manytricks.com/moom/)
if [ ! -d /Applications/Moom.app ]; then
  echo "Installing Moom..."
  brew install -q --cask moom
fi

# install [the unarchiver](http://unarchiver.c3.cx/unarchiver)
if [ ! -d "/Applications/The Unarchiver.app" ]; then
  echo "Installing The Unarchiver..."
  brew install -q --cask the-unarchiver
fi

# install [spotify](https://spotify.com/)
if [ ! -d /Applications/Spotify.app ]; then
  echo "Installing Spotify..."
  brew install -q --cask spotify
fi

# install [omnigraffle](https://omnigraffle.com/)
if [ ! -d /Applications/OmniGraffle.app ]; then
  echo "Installing OmniGraffle..."
  brew install -q --cask omnigraffle
fi

# install [chrome](https://www.google.com/chrome/browser/desktop/index.html)
if [ ! -d "/Applications/Google Chrome.app" ]; then
  echo "Installing Google Chrome..."
  brew install -q --cask google-chrome
fi

# install [firefox](https://www.mozilla.org/firefox/)
if [ ! -d /Applications/Firefox.app ]; then
  echo "Installing Firefox..."
  brew install -q --cask firefox
fi

# install [papers](http://papersapp.com/)
if [ ! -d /Applications/Papers.app ]; then
  echo "Installing Papers.app..."
  brew install -q --cask papers
fi

# install [dash](https://kapeli.com/dash)
if [ ! -d /Applications/Dash.app ]; then
  echo "Installing Dash..."
  brew install -q --cask dash
fi

# install [insomnia](https://insomnia.rest)
if [ ! -d /Applications/Insomnia.app ]; then
  echo "Installing Insomnia..."
  brew install -q --cask insomnia
fi

# install [capto](http://www.globaldelight.com/capto/)
if [ ! -d /Applications/Capto.app ]; then
  echo "Installing Capto..."
  brew install -q --cask capto
fi

# install [iStat Menus](https://bjango.com/mac/istatmenus/)
if [ ! -d "/Applications/iStat Menus.app" ]; then
  echo "Installing iStat Menus..."
  brew install -q --cask istat-menus
fi


## COMMAND LINE TOOLS ##

# install [zsh](http://www.zsh.org/)
if [ ! -e /usr/local/bin/zsh ]; then
  echo "Installing zsh..."
  brew install -q zsh
fi

# install [corkscrew](http://agroman.net/corkscrew/)
if [ ! -e /usr/local/bin/corkscrew ]; then
  echo "Installing corkscrew..."
  brew install -q corkscrew
fi

# install [armor](https://armor.labstack.com/)
if [ ! -e /usr/local/bin/armor ]; then
  echo "Installing armor..."
  brew install -q armor
fi

# install [shellcheck](https://github.com/koalaman/shellcheck)
if [ ! -e /usr/local/bin/shellcheck ]; then
  echo "Installing shellcheck..."
  brew install -q shellcheck
fi

# install [fzf](https://github.com/junegunn/fzf) fuzzy search
if [ ! -e /usr/local/bin/fzf ]; then
  echo "Installing fzf..."
  brew install -q fzf
fi

# install [silver searcher](http://geoff.greer.fm/ag/) grep replacement
if [ ! -e /usr/local/bin/ag ]; then
  echo "Installing ag..."
  brew install -q the_silver_searcher
fi

# install [httpie](https://httpie.org/) curl replacement
if [ ! -e /usr/local/bin/http ]; then
  echo "Installing httpie..."
  brew install -q httpie
fi

# install [htop](https://hisham.hm/htop/) top replacement
if [ ! -e /usr/local/bin/htop ]; then
  echo "Installing htop..."
  brew install -q htop
fi

# install [jq](https://stedolan.github.io/jq/)
if [ ! -e /usr/local/bin/jq ]; then
  echo "Installing jq..."
  brew install -q jq
fi

# install [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy/)
if [ ! -e /usr/local/bin/diff-so-fancy ]; then
  echo "Installing diff-so-fancy..."
  brew install -q diff-so-fancy
fi

# install [antibody](https://getantibody.github.io/) zsh plugin manager
if [ ! -e /usr/local/bin/antibody ]; then
  echo "Installing antibody..."
  brew install -q antibody
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
  brew install -q z
fi

# install [trash](http://hasseg.org/trash/) alternative to rm
if [ ! -e /usr/local/bin/trash ]; then
  echo "Installing trash..."
  brew install -q trash
fi


## GOLANG ##

# install [go](http://golang.org/)
if [ ! -e /usr/local/bin/go ]; then
  echo "Installing go..."
  brew install -q go
fi
mkdir -p $HOME/code/go
export GOPATH=$HOME/code/go

if [ ! -e /usr/local/bin/golangci-lint ]; then
  echo "Installing golangci-lint..."
  brew install -q golangci/tap/golangci-lint
  brew upgrade golangci/tap/golangci-lint
fi
if [ ! -e /usr/local/bin/modd ]; then
  echo "Installing modd tool..."
  brew install -q modd
fi
if [ ! -x $GOPATH/bin/devd ]; then
  echo "Installing devd webserver..."
  go get github.com/cortesi/devd/cmd/devd
fi
if [ ! -x $GOPATH/bin/goimports ]; then
  echo "Installing goimports..."
  go get golang.org/x/tools/cmd/goimports
fi
if [ ! -x $GOPATH/bin/gotype ]; then
  echo "Installing gotype..."
  go get golang.org/x/tools/cmd/gotype
fi
if [ ! -x $GOPATH/bin/cover ]; then
  echo "Installing cover..."
  go get golang.org/x/tools/cmd/cover
fi
if [ ! -x $GOPATH/bin/csvtk ]; then
  echo "Installing csvtk..."
  go get github.com/shenwei356/csvtk/csvtk
fi

if [ ! -x $GOPATH/bin/gops ]; then
  echo "Installing gops..."
  go get github.com/google/gops
fi


## NODE.JS ##

# install [node](http://nodejs.org/)
if [ ! -e /usr/local/bin/node ]; then
  echo "Installing node.js..."
  brew install -q node
fi
if [ ! -e /usr/local/bin/yarn ]; then
  echo "Installing yarn..."
  brew install -q yarn
fi


## RUBY ##

# install [ruby](https://www.ruby-lang.org/en/)
if [ ! -e /usr/local/bin/ruby ]; then
  brew install -q ruby
fi

# install [i2cssh](https://github.com/wouterdebie/i2cssh)
which i2cssh > /dev/null
if [ $? -eq 1 ]; then
  gem install i2cssh
fi


## DEVOPS TOOLS ##

# install [docker](https://www.docker.com/)
if [ ! -e /Applications/Docker.app ]; then
  echo "Installing docker..."
  curl -o /tmp/Docker.dmg https://download.docker.com/mac/stable/Docker.dmg
  open -W /tmp/Docker.dmg && cp -r /Volumes/Docker/Docker.app /Applications/ && diskutil unmount /Volumes/Docker
  open /Applications/Docker.app
  # Set up autocompletion for zsh.
  etc=/Applications/Docker.app/Contents/Resources/etc
  ln -s $etc/docker.zsh-completion /usr/local/share/zsh/site-functions/_docker
  ln -s $etc/docker-compose.zsh-completion /usr/local/share/zsh/site-functions/_docker-compose
fi

# install [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/)
if [ ! -e /usr/local/bin/kubectl ]; then
  echo "Installing kubectl..."
  brew install -q kubectl
fi

# install [minikube](https://minikube.sigs.k8s.io/)
if [ ! -e /usr/local/bin/minikube ]; then
  echo "Installing minikube..."
  brew install -q minikube
  # Set up autocompletion for zsh.
  brew install -q bash-completion
  source $(brew --prefix)/etc/bash_completion
  minikube completion zsh > ~/.minikube-completion
  source ~/.minikube-completion
fi



## DEV DEPENDENCIES ##

# install protobuf
if [ ! -e /usr/local/bin/protoc ]; then
  echo "Installing protobuf..."
  brew install -q protobuf
fi

# install nanomsg
if [ ! -e /usr/local/bin/nanocat ]; then
  echo "Installing nanomsg..."
  brew install -q nanomsg
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
brew install -q --cask qlmarkdown qlstephen qlcolorcode quicklook-json quicklook-csv betterzipql ttscoff-mmd-quicklook
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

# Create directory for software development.
mkdir -p $HOME/code

# Enable access for assistive devices
echo 'Requesting password to enable access for assistive devices'
echo -n 'a' | sudo tee /private/var/db/.AccessibilityAPIEnabled > /dev/null 2>&1
sudo chmod 444 /private/var/db/.AccessibilityAPIEnabled

echo "Disable Spotlight on backup drive"
sudo mdutil -i off "/Volumes/TimeMachine"

echo "Speeding up wake from sleep to 24 hours from an hour"
# http://www.cultofmac.com/221392/quick-hack-speeds-up-retina-macbooks-wake-from-sleep-os-x-tips/
sudo pmset -a standbydelay 86400

cd $CWD

echo ""
echo "Start Dropbox first, then 1Password."
echo "Install Things, Reeder, Pocket, and IA Writer via the App Store."
echo "Install Google Chrome Canary from https://www.google.com/chrome/browser/canary.html."
echo "Install Marked 2 from Dropbox."
echo "Turn off Spotlight shortcuts in Keyboard preferences."
echo "To use zsh, run the following:  sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh"
echo "Start Dropbox first to sync preferences..."
