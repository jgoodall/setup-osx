# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kennethreitz"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew git git-extras github node sublime osx rvm bower)

source $ZSH/oh-my-zsh.sh


####################################### 
#
# CUSTOMIZATION
#
####################################### 

export PATH=$HOME/bin:/usr/local/sbin:/usr/local/bin:$PATH

# FOR NODE.JS
if [[ -x /usr/local/bin/node ]]; then
  export NODE_PATH=/usr/local/share/npm/bin
  export PATH=$NODE_PATH:$PATH
fi

# load RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# if mactex is installed, add it to the path
if [ -d /usr/local/texlive/2012/bin/universal-darwin ] ; then
  export PATH=$PATH:/usr/local/texlive/2012/bin/universal-darwin
fi

# Don't clear the screen after quitting a manual page
export MANPAGER="less -X"

# Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"


####################################### 
#
# ALIASES
#
####################################### 

####################################### 
# DIRECTORIES
####################################### 
alias dl="~/Downloads"
alias dv="~/dev"
alias db="~/Dropbox"
alias wi="~/dev/wiki"

####################################### 
# LS
####################################### 
alias ls="ls -FG"
alias ll="ls -FGhl"
alias la="ls -FGa"

####################################### 
# MAC RELATED ALIASES 
####################################### 
if [[ `uname` = 'Darwin' ]]; then

  # Mac 'open' command to open a file
  alias o="open"
  
  # Quicklook
  alias ql="qlmanage -p "

  # Trim new lines and copy to clipboard
  alias c="tr -d '\n' | pbcopy"

  # Recursively delete `.DS_Store` files
  alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

  # Empty the Trash on all mounted volumes and the main HDD
  # Also, clear Apple's System Logs to improve shell startup speed
  alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

  # Show/hide hidden files in Finder
  alias show="defaults write com.apple.Finder AppleShowAllFiles -bool true && killall Finder"
  alias hide="defaults write com.apple.Finder AppleShowAllFiles -bool false && killall Finder"

  # Disable Spotlight
  alias spotoff="sudo mdutil -a -i off"
  # Enable Spotlight
  alias spoton="sudo mdutil -a -i on"

  # Hide/show all desktop icons (useful when presenting)
  alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
  alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

fi

####################################### 
# APPLICATION DEPENDENT ALIASES
####################################### 

# start up a web server on port 8000 in the current directory (or ./public)
# [http-server](https://github.com/nodeapps/http-server)
if [ -x /usr/local/share/npm/bin/http-server ] ; then
  alias ws="/usr/local/share/npm/bin/http-server -p 8000"
else
  alias ws="python -m SimpleHTTPServer 8000"
fi

# parallel gzip - [pigz](http://www.zlib.net/pigz/)
if [ -x /usr/local/bin/pigz ] ; then
  alias gzip="pigz"
fi

# aliases for [homebrew](http://mxcl.github.com/homebrew/)
if [ -x /usr/local/bin/brew ] ; then
  alias brewfr="brew update; brew outdated"
  alias brewup="brew update; brew upgrade"
fi

# alias for vagrant
if [ -x /usr/bin/vagrant ] ; then
  alias v="vagrant"
fi

# set default text editor to sublime
if [ -x "/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl" ] ; then
  export EDITOR="/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl"
else
  export EDITOR="vim"
fi

