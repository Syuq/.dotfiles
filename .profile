#!/bin/sh

# profile file. Runs on login. Environmental variables are set here.

# If you don't plan on reverting to bash, you can remove the link in ~/.profile
# to clean up.

export SECOND_BRAIN=("/home/tat/Repos/github.com/syuq/second-brain")
# Default programs:
export EDITOR=/usr/bin/nvim
export TERMINAL=/usr/local/bin/st
export TERMINAL_PROG="st"
export BROWSER=/usr/bin/brave
export DIFFPROG="nvim -d"
export VISUAL=/usr/bin/nvim
export PAGER="less"
# export PAGER="most"
export BAT_THEME="Dracula"
export GREP_COLORS='ms=01;32'
# export LESS='-iMRS -x2'
export LESS='-R --use-color -Dd+g$Du+b'
# export LESSOPEN='|~/.lessfilter %s'
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"

# Environment-local
# export CARGO_TARGET_DIR=@{HOME}/.cargo-target
# export PATH=${PATH}:@{HOME}/.cargo-target/release/

export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
# less
# export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
# export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"

# mclfy
export MCFLY_LIGHT=FALSE
export MCFLY_KEY_SCHEME=vim
export MCFLY_FUZZY=2
export MCFLY_RESULTS=50
export MCFLY_INTERFACE_VIEW=BOTTOM
export MCFLY_DISABLE_MENU=TRUE
export MCFLY_RESULTS_SORT=LAST_RUN
export MCFLY_PROMPT="❯"

# flutter
export PATH="$PATH:/home/tat/development/flutter/bin"

# neovide
# export NEOVIDE_FORK=0

# ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/var"

# X11
export XINITRC="$HOME/.xinitrc"

# Env
# export GOPATH="$XDG_DATA_HOME/go"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

# Rust stuff
export CARGO_INCREMENTAL=1
# export RUSTFLAGS DEFAULT="-C target-cpu=native"
export RUST_BACKTRACE=1

export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"

# PATH
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"
PathAppend() { [ -d "$1" ] && PATH="$PATH:$1"; }

## Go
PathAppend "$XDG_DATA_HOME/go/bin"
PathAppend "/usr/local/go/bin"
# Rust
PathAppend "$CARGO_HOME/bin"
# Lua
PathAppend "$XDG_DATA_HOME/.luarocks/bin"
unset PathAppend

# Other program settings:
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | paste -sd ':')"

# FFF
# export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_COMMAND='ag --nogroup --column --color ^'
export FZF_DEFAULT_OPTS='--history-size=50000 --height 40% --reverse --border'
# export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_BASE=/usr/bin/fzf

# cheat
export CHEAT_USE_FZF=true
export CHEAT_CONFIG_PATH="~/.config/cheat/conf.yml"

export GOPATH="$HOME/go"
# export GOPATH=$HOME/go:$HOME/projects
export GOROOT="/usr/lib/go"
export GOBIN=$HOME/go/bin
export GO111MODULE="on"

export PATH="$PATH:$HOME/go/bin"

export PATH="$PATH:$HOME/bin"
export PATH=~/bin:$PATH

# rofi
#export PATH=$HOME/.config/rofi/scripts:$PATH

# export GPG_TTY=$(tty)
# export SYSTEMD_LESS='FRXMK'

# sqllite
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"

#NNN
export NNN_OPTS="ErxH"
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_COLORS="2136"
export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'
export NNN_PLUG='f:finder;o:fzopen;p:mocplay;d:diffs;t:nmount;v:imgview'
export NNN_TRASH=1

BLK="04" CHR="04" DIR="04" EXE="00" REG="00" HARDLINK="00" SYMLINK="06" MISSING="00" ORPHAN="01" FIFO="0F" SOCK="0F" OTHER="02"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"

#ANDROID
# export ANDROID_HOME=$HOME/.jdks/openjdk-20.0.2
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/platform-tools

# export BASE_DIR=/opt
# export ANDROID_SDK=$BASE_DIR/android-sdk
# export ANDROID_PATH=$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools

# JAVA stuff
export JAVA_HOME="$(dirname $(dirname $(realpath $(which javac))))"
export _JAVA_AWT_WM_NONREPARENTING=1 # Fix for Java applications in dwm
# export _JAVA_OPTIONS DEFAULT="-Dawt.useSystemAAFontSettings=lcd -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"
export JAVA_FONTS=/usr/share/fonts/TTF
export MATLAB_JAVA=/usr/lib/jvm/default-runtime
export J2D_D3D=false

# Node
# export npm_config_prefix="$HOME/.npm-global"
# export PATH=~/.npm-global/bin:$PATH
PATH="$HOME/.local/bin:$PATH"
# export npm_config_prefix="$HOME/.local"

# Start graphical server on tty1 if not already running.
#[ "$(tty)" = "/dev/tty1" ] && ! pidof Xorg >/dev/null 2>&1  && exec startx "$XINITRC"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"

# Encoding stuff for the terminal
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export BUNDLER_EDITOR=nvim

# Set ipdb as the default Python debugger
export PYTHONBREAKPOINT=ipdb.set_trace

# # Load rbenv if installed (to manage your Ruby versions)
# export PATH="${HOME}/.rbenv/bin:${PATH}" # Needed for Linux/WSL
# type -a rbenv > /dev/null && eval "$(rbenv init -)"

# # Load pyenv (to manage your Python versions)
# export PYENV_VIRTUALENV_DISABLE_PROMPT=1
# type -a pyenv > /dev/null && eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init -)" && RPROMPT+='[🐍 $(pyenv_prompt_info)]'

# # Load nvm (to manage your node versions)
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# brew
#eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# rust
export PATH="$PATH:$HOME/.cargo/bin"

# java
export PATH="$JAVA_HOME/bin:$PATH"
export CLASSPATH=$CLASSPATH:/usr/share/tomcat9/lib/servlet-api.jar

# flutter firebase
export PATH="$PATH":"$HOME/.pub-cache/bin"

NVIM_RAYX=~/.config/nvim-rayx
export NVIM_RAYX

# Other program settings:
export DICS="/usr/share/stardict/dic/"
export MOZ_USE_XINPUT2="1" # Mozilla smooth scrolling/touchpads.

# Ibus
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT4_IM_MODULE=ibus
export CLUTTER_IM_MODULE=ibus

# pass
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"

# forgit
export FORGIT_CHECKOUT_BRANCH_BRANCH_GIT_OPTS='--sort=-committerdate'
export FORGIT_FZF_DEFAULT_OPTS="
--exact
--border
--cycle
--reverse
--height '80%'
"

# ssh
# export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

export MYSQL_PS1="\u@\h [\d]> " # Prompt mysql
