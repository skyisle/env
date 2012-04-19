if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f ~/.alias ]; then
	. ~/.alias
fi

export LANG=ko_KR.UTF-8

HOSTNAME=`hostname -s`
if [ ${HOSTNAME} == 'abouts' ];
then
    PROMPT_COLOR='1;32'
else
    PROMPT_COLOR='1;34'
fi

export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/lib


#########################################################
# Android 
#########################################################
export ANDROID_SDK_ROOT=/usr/local/Cellar/android-sdk/latest
export ANDROID_NDK=/usr/local/Cellar/android-ndk/latest
export ANDROID_HOME=$ANDROID_SDK_ROOT
export PATH=$ANDROID_SDK_ROOT/platform-tools:$PATH

# Go!
export GOROOT=~/go/
export PATH=$GOROOT/bin:$PATH

export PATH=~/bin:$PATH
export PATH=~/bin/vogar/bin:$PATH

# node
#export PATH=~/.node/node_v0.4.12/bin:$PATH

# Titanium
alias titanium="$HOME/Library/Application\ Support/Titanium/mobilesdk/osx/1.7.5/titanium.py"
export PATH=/usr/local/Cellar/ruby/1.9.3-p0/bin:$PATH

# nginx
export PATH=$PATH:/usr/local/nginx/sbin


export PATH=/usr/local/bin:$PATH

# set the number of open files to be 1024
ulimit -S -n 1024
export USE_CCACHE=1
export CCACHE_DIR=/Volumes/HDD/ccache/

[ -z "$PS1" ] && return

# homebrew
export HOMEBREW_TEMP=/usr/local/tmp

if [ -f `brew --prefix`/etc/bash_completion  ]; then
    . `brew --prefix`/etc/bash_completion 
fi

#########################################################
# LS_COLORS
#########################################################
export LS_COLORS=':di=00;34:ex=00;32:ln=00;36'
export CLICOLOR=1
export PS1="\[\033["$PROMPT_COLOR"m\]\u.\h:\w\$ \[\033[0m\]"

#########################################################
# Terminal settings
#########################################################
stty intr "^c" erase "^?" susp "^z" kill "^u"
alias lstree="ls -R | grep \":$\" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

export TITANIUM_SDK="/Library/Application Support/Titanium"
export ANDROID_SDK=$ANDROID_SDK_ROOT
