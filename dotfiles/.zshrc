ZSHA_BASE=$HOME/.zsh-antigen
source $ZSHA_BASE/antigen.zsh

antigen use oh-my-zsh

antigen theme ys
# antigen theme agnoster

# source /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

# antigen bundle arialdomartini/oh-my-git
# antigen theme arialdomartini/oh-my-git-themes oppa-lana-style

# antigen theme https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme.git powerline

antigen bundle z
antigen bundle cp
antigen bundle history
antigen bundle command-not-found
antigen bundle colored-man-pages
antigen bundle colorize

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

antigen bundle rimraf/k
antigen bundle uvaes/fzf-marks

antigen bundle git
antigen bundle git-extras
antigen bundle github

antigen bundle go
antigen bundle node
antigen bundle npm

antigen bundle vagrant
antigen bundle docker

if [[ `uname -s` == 'Darwin' ]]; then
    antigen bundle brew
    antigen bundle brew-cask
    antigen bundle osx
fi

antigen bundle unixorn/autoupdate-antigen.zshplugin

antigen apply

CASE_SENSITIVE="false"
COMPLETION_WAITING_DOTS="true"

#######################################
#
# CUSTOMIZATION
#
#######################################

# [marker](https://github.com/pindexis/marker) terminal command palette
# Ctrl-space: search for commands that match the current written string in the command-line
# Ctrl-k (or marker add): Bookmark a command
# Ctrl-t: place the cursor at the next placeholder, identified by '{{anything}}'
# marker remove
if [ -d $HOME/.marker ]; then
  [[ -s "$HOME/.local/share/marker/marker.sh" ]] && source "$HOME/.local/share/marker/marker.sh"
fi

# [Quick Command-line File Completion](https://github.com/pindexis/qfc)
# shortcut - control - d
qfc_complete_SHORTCUT="\C-d"
[[ -s "$HOME/.qfc/bin/qfc.sh" ]] && source "$HOME/.qfc/bin/qfc.sh"

# http://superuser.com/questions/836883/increasing-yosemite-maxfile-limit-for-application
# if [[ `uname -s` == 'Darwin' ]]; then
  # ulimit -n 65536
  # ulimit -u 2048
# fi

# Colors!
export TERM="xterm-256color"

# used by [atlas](https://atlas.hashicorp.com/)
export ATLAS_TOKEN=""

# for stupid Java
if [[ `uname -s` == 'Darwin' ]]; then
  export JAVA_HOME=`/usr/libexec/java_home`
  export PATH=$JAVA_HOME/bin:$PATH
fi

export PATH=$HOME/bin:/usr/local/sbin:/usr/local/bin:$PATH

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

# GOROOT-based binaries
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# Default Go path
export GOPATH=~/dev/go

# For Go binaries
export PATH=$PATH:$GOPATH/bin


#######################################
#
# ALIASES
#
#######################################

# sort top by cpu instead of pid
alias top='top -o cpu'

# go into the dir just created
function mcd() {
  mkdir -p "$1" && cd "$1";
}

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

# start up a web server on port 8000 in the current directory.
# [devd](https://github.com/cortesi/devd)
if [ ! -x $GOPATH/bin/devd ] ; then
  go get github.com/cortesi/devd/cmd/devd
fi
alias ws="devd -o -l -x ".git" -p 8000 ."
# alias ws="python -m SimpleHTTPServer 8000"

# parallel gzip - [pigz](http://www.zlib.net/pigz/)
if [ -x /usr/local/bin/pigz ] ; then
  alias gzip="pigz"
fi

# aliases for [homebrew](http://mxcl.github.com/homebrew/)
if [ -x /usr/local/bin/brew ] ; then
  alias brewfr="brew update && echo '\n==> Outdated Formulae' &&  brew outdated"
  alias brewup="echo 'Upgrading brew formulae...\n' && brew update && brew upgrade"
fi

# alias for vagrant
if [ -x /usr/bin/vagrant ] ; then
  alias v="vagrant"
  alias vst="vagrant status"
  # alias for vagrant vmware provider
  if [[ `vagrant plugin list | grep vagrant-vmware-fusion | cut -d' ' -f1` == "vagrant-vmware-fusion" ]]; then
    export VAGRANT_DEFAULT_PROVIDER=vmware_fusion
  fi
fi

export EDITOR="vim"

# added by travis gem
[ -f /Users/ojg/.travis/travis.sh ] && source /Users/ojg/.travis/travis.sh

# [bat](https://github.com/astaxie/bat) - curl for humans
[ -f $HOME/dev/go/bin/bat ] && alias b="$HOME/dev/go/bin/bat"

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# [z](https://github.com/rupa/z) - jump around
. /usr/local/Cellar/z/1.9/etc/profile.d/z.sh
