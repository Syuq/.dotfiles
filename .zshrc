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
         # emoji-clock
         man
         fzf
         copypath
         copyfile
         emoji
)

source $ZSH/oh-my-zsh.sh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#000000,bold"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)


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

#alias
source $HOME/.aliases

eval "$(starship init zsh)"
eval $(thefuck --alias)
eval "$(zoxide init zsh)"
eval "$(navi widget zsh)"
eval "$(atuin init zsh --disable-ctrl-r)"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# . ~/.oh-my-zsh/custom/plugins/z/z.sh

random_emoji fruits

# Rainbows and unicorns!
fortune | cowsay | lolcat

# Displays current time
# emoji-clock

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

#Coin
# coinmon -f shib

