#!/usr/bin/zsh
 # _____  _  _____             _
# |_   _|/ \|_   _|  __      _(_)_ __   ___
 #  | | / _ \ | |____\ \ /\ / | | '_ \ / _ \
 #  | |/ ___ \| |_____\ V  V /| | | | |  __/
 #  |_/_/   \_|_|      \_/\_/ |_|_| |_|\___|

bold=$(tput bold)
normal=$(tput sgr0)

GREEN='\033[1;32m'
YELLOW='\033[1;30m'
BLUE='\033[0;33m'
NC='\033[0m' # No Color

function ordinal () {
  case "$1" in
    *1[0-9] | *[04-9]) echo "$1"th;;
    *1) echo "$1"st;;
    *2) echo "$1"nd;;
    *3) echo "$1"rd;;
  esac
}

if [ $(date +%j) = 256 ]; then
  echo "CODING DAY 🐧"
fi

echo "$(ordinal ${GREEN}${bold}$(date +%j)) ${YELLOW}day"

cal -3
echo "${normal}🌴" 
# echo ${(%):-'%F{yellow}%B%b%f'}
echo "${Blue}${bold}$(sb-clock)"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

mkfile() { mkdir -p "$(dirname "$1")" && touch "$1" ;  }
# Path to your oh-my-zsh installation.
export ZSH="/home/tat/.oh-my-zsh"

# ZSH_THEME="dracula"
# DRACULA_DISPLAY_CONTEXT=1
# export KEYTIMEOUT=1
# VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
# VI_MODE_SET_CURSOR=true

# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

plugins=(
         git-flow-completion
         sudo
         web-search
         # vi-mode
         zsh-autosuggestions
         node
         zsh-syntax-highlighting
         history-substring-search
         command-not-found
         colored-man-pages
         emotty
         emoji-clock
         man
         fzf
         copypath
         copyfile
         emoji
)

source $ZSH/oh-my-zsh.sh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#000000,bold"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

alias webcam="mpv --no-cache --no-osc --no-input-default-bindings --profile=low-latency --input-conf=/dev/null --title=webcam $(ls /dev/video[0,2,4,6,8] | tail -n 1)"
alias ls='ls --color=auto'
alias ll="exa --icons --git -la"
# alias tree="exa --icons --tree"
#alias ping="prettyping"
alias ip="ip -color=auto"
alias grep="grep --color=auto"
alias gsync="git checkout master && git fetch upstream && git rebase upstream/master && git push"
alias glog='git log --graph --oneline --decorate --all'

alias packtime="expac --timefmt='%Y-%m-%d %T' '%l\t%n' | sort | tail -n 40"
alias packinstalled="comm -12 <(grep -Poe '\[ALPM\] installed \K\S*' /var/log/pacman.log | sort | uniq) <(pacman -Qeqn | sort)"

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias pacman-contrib='pacman -Ql pacman pacman-contrib | grep -E 'bin/.+''
alias pacfzf='pacman -Slq | fzf --preview 'pacman -Si {}' --layout=reverse'
alias nv='neovide --nofork --multigrid'
alias bc='bc -l ~/.bcrc'

# npm shortcuts that only list top-level modules
alias l="yarn list --depth=0 2>/dev/null"
alias lg="npm list -g --depth=0 2>/dev/null"

# navi
navibestmatch() {
    navi --query "$1" --best-match
}

alias el="navibestmatch 'This is one command'"
alias ef="navibestmatch 'This is another command'"

# git shortcuts
alias gg="git log --graph --pretty=format:'%C(bold red)%h%Creset -%C(bold yellow)%d%Creset %s %C(bold green)(%cr) %C(bold blue)<%an>%Creset %C(yellow)%ad%Creset' --abbrev-commit --date=short"
alias ggr="git log --reverse --pretty=format:'%C(bold red)%h%Creset -%C(bold yellow)%d%Creset %s %C(bold green)(%cr) %C(bold blue)<%an>%Creset %C(yellow)%ad%Creset' --abbrev-commit --date=short"

alias nvb='XDG_DATA_HOME=$NVIM_BEGINNER/share XDG_CACHE_HOME=$NVIM_BEGINNER XDG_CONFIG_HOME=$NVIM_BEGINNER nvim'
# alias pacsize="LC_ALL=C pacman -Qi | awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' | sort -h"

# Call `nvm use` automatically in a directory with a `.nvmrc` file
autoload -U add-zsh-hook
load-nvmrc() {
  if nvm -v &> /dev/null; then
    local node_version="$(nvm version)"
    local nvmrc_path="$(nvm_find_nvmrc)"

    if [ -n "$nvmrc_path" ]; then
      local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

      if [ "$nvmrc_node_version" = "N/A" ]; then
        nvm install
      elif [ "$nvmrc_node_version" != "$node_version" ]; then
        nvm use --silent
      fi
    elif [ "$node_version" != "$(nvm version default)" ]; then
      nvm use default --silent
    fi
  fi
}
type -a nvm > /dev/null && add-zsh-hook chpwd load-nvmrc
type -a nvm > /dev/null && load-nvmrc


#zsh syntax highlighting dracula 
#source /home/tat/.oh-my-zsh/custom/themes/dracu-syntax-highlighting.zsh 
source /home/tat/.oh-my-zsh/custom/themes/zsh-syntax-highlighting/zsh-syntax-highlighting.sh 

eval "$(starship init zsh)"
eval $(thefuck --alias)
eval "$(zoxide init zsh)"
eval "$(navi widget zsh)"
eval "$(atuin init zsh)"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# . ~/.oh-my-zsh/custom/plugins/z/z.sh

random_emoji fruits

# Rainbows and unicorns!
fortune | cowsay | lolcat

# Displays current time
emoji-clock

# bun completions
[ -s "/home/tat/.bun/_bun" ] && source "/home/tat/.bun/_bun"

# Bun
export BUN_INSTALL="/home/tat/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

#Broot
source /home/tat/.config/broot/launcher/bash/br

# Load Angular CLI autocompletion.
source <(ng completion script)

# nvm
source /usr/share/nvm/init-nvm.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/tat/Templates/test/test/google-cloud-sdk/path.zsh.inc' ]; then . '/home/tat/Templates/test/test/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/tat/Templates/test/test/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/tat/Templates/test/test/google-cloud-sdk/completion.zsh.inc'; fi
