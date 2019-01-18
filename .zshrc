export ZSH=/Users/x/.oh-my-zsh
ZSH_THEME="agnoster"
plugins=(git)
source $ZSH/oh-my-zsh.sh

export ANDROID_HOME="/Users/x/Library/Android/sdk"
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

DEFAULT_USER=x

alias 'vim'=/usr/local/Cellar/vim/8.1.0700/bin/vim

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:‘/Users/x/Library/Python/2.7/lib/python/site-packages’
export PATH="$PATH:$HOME/.rvm/bin"

export PATH="$HOME/.yarn/bin:$PATH"

export PATH=/Users/x/flutter/bin:$PATH

function v() {
	adb shell input keyevent 82
}

function ra() {
	react-native run-android
}

function re() {
	react-native run-ios
}

function list() {
	xcrun simctl list
}

function rs() {
	react-native run-ios --simulator="iPhone "$1""
}

function hp () {
 awk "BEGIN {print ($1/667)*100}"
}

function wp () {
 awk "BEGIN {print ($1/375)*100}"
}

function we() {
	curl wttr.in/~Dhaka
}

function ps() {
	pg_ctl -D /usr/local/var/postgres start
}

function psp() {
	pg_ctl -D /usr/local/var/postgres stop
}

function seed() {
	node  -r babel-register -r dotenv/config src/bin/seed
}

function ad() {
	cd ~/projects/sukun/adminMobile/ && re
}

function cs() {
	pgcli postgres://postgres:postgres@postgres.cqgbwfs55twu.us-east-1.rds.amazonaws.com:5432/postgres
}
