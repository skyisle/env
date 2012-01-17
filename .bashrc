if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f ~/.alias ]; then
	. ~/.alias
fi

export LANG=ko_KR.UTF-8

PROMPT_COLOR='1;34'
export PS1="\[\033["$PROMPT_COLOR"m\]\u.\h:\w\$ \[\033[0m\]"

#########################################################
# LS_COLORS
#########################################################
export LS_COLORS=':di=00;34:ex=00;32:ln=00;36'
export CLICOLOR=1

#########################################################
# Terminal settings
#########################################################
stty intr "^c" erase "^?" susp "^z" kill "^u"

export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/lib
alias lstree="ls -R | grep \":$\" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

#########################################################
# Android 
#########################################################
export ANDROID_HOME=/devel/android-sdk
export PATH=$ANDROID_HOME/tools:/$ANDROID_HOME/platform-tools/:$PATH
export PATH="/Developer/usr/bin:${PATH}"

# Go!
export GOROOT=~/go/
export PATH=$GOROOT/bin:$PATH

export PATH=~/bin:$PATH
export PATH=~/bin/vogar/bin:$PATH

export NODE_PATH=/usr/local/lib/node_modules

# Titanium
alias titanium="$HOME/Library/Application\ Support/Titanium/mobilesdk/osx/1.7.5/titanium.py"
export PATH=/usr/local/Cellar/ruby/1.9.3-p0/bin:$PATH

# nginx
export PATH=$PATH:/usr/local/nginx/sbin

# jsctags
export NODE_PATH=/usr/local/lib/jsctags/:$NODE_PATH

# homebrew
export HOMEBREW_TEMP=/usr/local/tmp
if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash  ]; then
    . `brew --prefix`/etc/bash_completion.d/git-completion.bash 
fi
export PATH=/usr/local/bin:$PATH

# set the number of open files to be 1024
ulimit -S -n 1024
