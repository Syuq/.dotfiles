# |_   _|/ \|_   _|
#   | | / _ \ | |
#   | |/ ___ \| |
#   |_/_/   \_|_|

#!/bin/zsh

# profile file. Runs on login. Environmental variables are set here.

# If you don't plan on reverting to bash, you can remove the link in ~/.profile
# to clean up.

# Default programs:
export EDITOR=/usr/bin/nvim
export TERMINAL=/usr/local/bin/st
export BROWSER=/usr/bin/brave
export DIFFPROG="nvim -d"
export VISUAL=/usr/bin/nvim
export PAGER="less"
export BAT_THEME="Nord"
# export LESS='-iMRS -x2'
export LESS='-R --use-color -Dd+g$Du+b'

export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# export PATH="$PATH:/home/tat/flutter/bin"

# ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# X11
export XINITRC="$HOME/.xinitrc"

# Other program settings:
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | paste -sd ':')"

# FFF
# export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_COMMAND='ag --nogroup --column --color ^'
export FZF_DEFAULT_OPTS='--history-size=50000 --height 40% --reverse --border'
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# export GOPATH="$HOME/go"
export GOPATH=$HOME/go:$HOME/projects
export GOROOT="/usr/lib/go"
export GOBIN=$HOME/go/bin
export GO111MODULE="on"

export PATH="$PATH:$HOME/go/bin"

export PATH="$PATH:$HOME/bin"
export PATH=~/bin:$PATH

# export GPG_TTY=$(tty)
# export SYSTEMD_LESS='FRXMK'

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
export ANDROID_HOME=/opt/android-sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

export JAVA_HOME="$(dirname $(dirname $(realpath $(which javac))))"
export _JAVA_AWT_WM_NONREPARENTING=1	# Fix for Java applications in dwm

# Node
export npm_config_prefix="$HOME/.local"

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

# brew
#eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# rust
export PATH="$PATH:$HOME/.cargo/bin"

# java 
export PATH="$JAVA_HOME/bin:$PATH"
export CLASSPATH=$CLASSPATH:/usr/share/tomcat9/lib/servlet-api.jar

#NVIM_BEGINNER=~/.config/nvim-beginner
#export NVIM_BEGINNER
