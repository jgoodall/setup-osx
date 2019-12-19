 all the other Ping stuff in iTunes
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
echo "Install Apple Apps (Pages, Numbers, and Keynote) via the App Store."
echo "Install Pocket, Trello, and IA Writer via the App Store."
echo "Install Google Chrome Canary from https://www.google.com/chrome/browser/canary.html."
echo "Install Marked 2 from Dropbox."
echo "To use zsh, run the following:  sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh"
