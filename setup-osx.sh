#!/bin/sh

LIB=$HOME/Library
APP_SUPPORT=$LIB/Application\ Support

# Current directory
CWD=`pwd`

#################################################################
# Install tools
#################################################################

# install [brew](http://mxcl.github.com/homebrew/)
if [ ! -x /usr/local/bin/brew ]; then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
fi

# install [git](http://git-scm.com/)
if [ ! -x /usr/local/bin/git ]; then
  echo "Installing git..."
  brew install git
fi

# install [zsh](http://www.zsh.org/)
if [ ! -x /usr/local/bin/zsh ]; then
  echo "Installing zsh and setting to a default shell..."
  brew install zsh
  chsh -s /bin/zsh
fi

# install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
if [ ! -d $HOME/.oh-my-zsh ]; then
  echo "Installing oh-my-zsh..."
  curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi

# install [node](http://nodejs.org/)
if [ ! -x /usr/local/bin/node ]; then
  echo "Installing node.js..."
  brew install node
fi

if [ ! -d /usr/local/lib/node_modules/jshint ]; then
  echo "Installing jshint..."
  npm install -g jshint
fi

if [ ! -d /usr/local/lib/node_modules/jsonlint ]; then
  echo "Installing jsonlint..."
  npm install -g jsonlint
fi

if [ ! -d /usr/local/lib/node_modules/http-server ]; then
  echo "Installing http-server..."
  npm install -g http-server
fi

if [ ! -d /usr/local/lib/node_modules/reveal-md ]; then
  echo "Installing reveal-md..."
  npm install -g reveal-md
fi

if [ ! -d /usr/local/lib/node_modules/bower ]; then
  echo "Installing bower..."
  npm install -g bower
fi

if [ ! -d /usr/local/lib/node_modules/grunt-cli ]; then
  echo "Installing grunt-cli..."
  npm install -g grunt-cli
fi

if [ ! -d /usr/local/lib/node_modules/yo ]; then
  echo "Installing yo..."
  npm install -g yo
fi

if [ ! -d /usr/local/lib/node_modules/karma ]; then
  echo "Installing karma..."
  npm install -g karma
fi

# install python
if [ ! -x /usr/local/bin/python ]; then
  echo "Installing python and pip..."
  brew install python
  /usr/local/bin/pip install --upgrade distribute
  /usr/local/bin/pip install --upgrade pip
fi

# install [rvm](https://rvm.io/)
if [ ! -x $HOME/.rvm/bin/rvm ]; then
  echo "Installing ruby and rvm..."
  brew tap --repair homebrew/dupes
  brew install apple-gcc42 autoconf automake libtool libyaml libxml2 libxslt libksba openssl
  \curl -L https://get.rvm.io | bash -s stable --ruby=1.9.3
fi


#################################################################
# Copy dot files/dirs from here into home directory
#################################################################

echo "Copying dot files..."
for i in `ls -Ad dotfiles/.[A-Za-z]*` ; do
  cp -f `pwd`/$i $HOME
done


#################################################################
# Application Configurations
#################################################################

# [Chrome](https://chrome.google.com) web inspector css
echo "Copying Chrome custom styles..."
CHROME_DIR=$APP_SUPPORT/Google/Chrome/Default
if [ -d "$CHROME_DIR" ]; then
  if [ ! -d "$CHROME_DIR/User StyleSheets" ]; then
    mkdir "$CHROME_DIR/User StyleSheets"
  fi
  cat $CWD/mac/apps/Chrome/Custom.css > $CHROME_DIR/User\ StyleSheets/Custom.css
fi

# [Marked](http://markedapp.com/)
MARKED_DIR=$APP_SUPPORT/Marked
echo "Copying Marked.app custom styles..."
if [ -d "$MARKED_DIR" ]; then
  if [ ! -d "$MARKED_DIR/Custom CSS" ]; then
    mkdir "$MARKED_DIR/Custom CSS"
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
cd $LIB/QuickLook
# [The BetterZip Quick Look Generator](http://macitbetter.com/BetterZip-Quick-Look-Generator/)
curl -O --silent --location http://macitbetter.com/BetterZipQL.zip && unzip -qof BetterZipQL.zip && rm BetterZipQL.zip
# [MultiMarkdown Quick Look with Style](https://github.com/ttscoff/MMD-QuickLook)
curl -O --silent --location http://assets.brettterpstra.com/MultiMarkdown%20QuickLook.qlgenerator.zip && unzip -qof MultiMarkdown%20QuickLook.qlgenerator.zip && rm MultiMarkdown%20QuickLook.qlgenerator.zip
# [QLStephen](http://whomwah.github.io/qlstephen/)
curl -O --silent --location https://github.com/downloads/whomwah/qlstephen/QLStephen.qlgenerator.zip && unzip -qof QLStephen.qlgenerator.zip && rm QLStephen.qlgenerator.zip
# [QuickLookCSV](https://github.com/p2/quicklook-csv)
cd /tmp && curl -O --silent --location http://quicklook-csv.googlecode.com/files/QuickLookCSV.dmg && hdiutil attach -quiet QuickLookCSV.dmg && cp -rf /Volumes/QuickLook\ CSV/QuickLookCSV.qlgenerator . && hdiutil detach -quiet /Volumes/QuickLook\ CSV
rm -rf *rtf *rtfd
qlmanage -r
cd $CWD

# applescripts
echo "Copying AppleScripts..."
cp -rf $CWD/mac/Scripts/* $LIB/Scripts/

# services
echo "Copying System Services..."
cp -rf $CWD/mac/Services/* $LIB/Services/


#################################################################
# System Fonts
# Get fonts from http://www.fontsquirrel.com/fonts/
#################################################################

echo "Installing Fonts..."
cd $LIB/Fonts
\curl -O --silent --location http://www.fontsquirrel.com/fonts/download/Anonymous-Pro && unzip -qof Anonymous-Pro && rm Anonymous-Pro
\curl -O --silent --location http://www.fontsquirrel.com/fonts/download/Inconsolata && unzip -qof Inconsolata && rm Inconsolata
\curl -O --silent --location http://www.fontsquirrel.com/fonts/download/source-code-pro && unzip -qof source-code-pro && rm source-code-pro
\curl -O --silent --location http://www.fontsquirrel.com/fonts/download/architects-daughter && unzip -qof architects-daughter && rm architects-daughter
\curl -O --silent --location http://www.fontsquirrel.com/fonts/download/Daniel && unzip -qof Daniel && rm Daniel
mv -f *.txt ~/.Trash/
cd $CWD


#################################################################
# Binaries in bin will be copied to $HOME/bin
#################################################################

if [ ! -d $HOME/bin ]; then
  mkdir $HOME/bin
fi
cp -f $CWD/bin/* $HOME/bin/


#################################################################
# Set up OS X defaults
# Many of these come from: http://mths.be/dotfiles
#################################################################

echo "Setting up system defaults..."

# be quiet on login
touch ~/.hushlogin

#################################################################
# General UI/UX                                                 #
#################################################################

# Menu bar: disable transparency
defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false

# Menu bar: hide the useless Time Machine and Volume icons
defaults write com.apple.systemuiserver menuExtras -array "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" "/System/Library/CoreServices/Menu Extras/AirPort.menu" "/System/Library/CoreServices/Menu Extras/Battery.menu" "/System/Library/CoreServices/Menu Extras/Clock.menu"

# Always show scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
  
# Increase window resize speed for Cocoa applications
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Set Help Viewer windows to non-floating mode
defaults write com.apple.helpviewer DevMode -bool true

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

#################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input   #
#################################################################

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Enable access for assistive devices
echo 'Requesting password to enable access for assistive devices'
echo -n 'a' | sudo tee /private/var/db/.AccessibilityAPIEnabled > /dev/null 2>&1
sudo chmod 444 /private/var/db/.AccessibilityAPIEnabled

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0

# Automatically illuminate built-in MacBook keyboard in low light
defaults write com.apple.BezelServices kDim -bool true
# Turn off keyboard illumination when computer is not used for 5 minutes
defaults write com.apple.BezelServices kDimTime -int 300


#################################################################
# Screen                                                        #
#################################################################

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "$HOME/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Enable subpixel font rendering on non-Apple LCDs
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

cd $CWD
