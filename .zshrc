export ZSH=/Users/x/.oh-my-zsh 
ZSH_THEME="agnoster" 
plugins=(git) 
source $ZSH/oh-my-zsh.sh

export ANDROID_HOME="/Users/x/Library/Android/sdk" 
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export GO_HOME="/usr/local/Cellar/go/1.12.6" 
export PATH=${GO_HOME}/go/bin:$PATH
#export PATH="/Users/x/fuchsia/.jiri_root/bin"

DEFAULT_USER=x
#alias 'vim'=/usr/local/Cellar/vim/8.1.0700/bin/vim

BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


#export PATH=$PATH:‘/Users/x/Library/Python/2.7/lib/python/site-packages’ :#export PATH="$PATH:$HOME/.rvm/bin"

export PATH="$HOME/.yarn/bin:$PATH"
export PATH=/Users/x/flutter/bin:$PATH
export PATH="$PATH:/usr/local/Cellar/elixir/1.8.1/bin"

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
 awk "BEGIN {print ($1/737)*100}"
}

function wp () {
 awk "BEGIN {print ($1/414)*100}"
}

function vh() {
 awk "BEGIN {print ($1/1080)*100}"
}

function vw() {
 awk "BEGIN {print ($1/1920)*100}"
}

function we() {
	curl wttr.in/~Dhaka
}


function ad() {
	cd ~/projects/sukun/adminMobile/ && re
}

function s() {
	yarn start
}

function d() {
	yarn dev
}

function p() {
	elixir -pa _build/dev/consolidated -S mix run --config my_config.exs --no-halt
}
function ss() {
	sed -i '' 's/startsWith/includes/g' node_modules/react-native/local-cli/runIOS/findMatchingSimulator.js
}

function rh() {
	git reset head --hard
}

