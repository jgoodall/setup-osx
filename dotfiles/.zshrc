# antibody
source <(antibody init)

# Oh-My-Zsh
ANTIBODY_HOME="$(antibody home)"
export ZSH="$ANTIBODY_HOME"/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh
ZSH_THEME=ys
DISABLE_AUTO_UPDATE="false"
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

antibody bundle robbyrussell/oh-my-zsh
antibody bundle < ~/.zsh_plugins.txt


# https://github.com/zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

#######################################
#
# CUSTOMIZATION
#
#######################################

export EDITOR="code"

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

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# Colors!
export TERM="xterm-256color"

# for ruby on mac
if [[ `uname -s` == 'Darwin' ]]; then
  export PATH=/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/2.6.0/bin:$PATH
fi

export PATH=$HOME/bin:/usr/local/sbin:/usr/local/bin:$PATH

# Don't clear the screen after quitting a manual page
export MANPAGER="less -X"

# Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"

# GOROOT-based binaries
if [[ `uname -s` == 'Darwin' ]]; then
  export PATH=$PATH:/usr/local/opt/go/libexec/bin
else
  export PATH=$PATH:/usr/local/go/bin
fi

# Development directory
export DEV=$HOME/code

# Default Go path/bin
export GOPATH=$DEV/go
export GOBIN=$GOPATH/bin
export GOPRIVATE=*.ornl.gov

# For Go binaries
export PATH=$PATH:$GOBIN


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

# [z](https://github.com/rupa/z) - jump around
[ -f /usr/local/Cellar/z/1.9/etc/profile.d/z.sh ] && . /usr/local/Cellar/z/1.9/etc/profile.d/z.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# alias to check all updates
alias check_updates="softwareupdate --list && brew update > /dev/null && brew outdated"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

if [ -x /usr/local/bin/kafka-server-start ]; then
  alias kafka-start="zookeeper-server-start /usr/local/etc/kafka/zookeeper.properties & kafka-server-start /usr/local/etc/kafka/server.properties &"
  alias kafka-stop="kafka-server-stop ; zookeeper-server-stop"
  alias kafka-delete="rm -rf /usr/local/var/lib/kafka-logs/*"
  alias kafka-topic-list="kafka-topics --list --zookeeper ${kafkahost:-localhost}:2181"
fi

if [ -x /usr/local/bin/elasticsearch ]; then
  alias es-start="elasticsearch"
  alias es-delete="rm -rf /usr/local/var/elasticsearch/*"
  alias es-health="curl -s ${eshost:-localhost}:9200/_cat/health\?v\&h=cluster,st,sh,pri,unassign"
  alias es-indices="curl -s ${eshost:-localhost}:9200/_cat/indices\?v\&h=index,health,status,pri,rep,count,docsCount,storeSize"
  alias es-threadpool="curl -s ${eshost:-localhost}:9200/_cat/thread_pool\?v"
fi

if [ -x /usr/local/bin/go ]; then
  alias go-mod-list="go list -u -m -f '{{if not .Indirect}}{{.}}{{end}}' all 2> /dev/null"
  alias go-mod-outdated="go list -u -m -f '{{if not .Indirect}}{{if .Update}}{{.}}{{end}}{{end}}' all 2> /dev/null"
fi
