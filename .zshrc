 # ^^^^^^:                       
# .J55555B5.     ~!     .?YYY555Y
 #       Y@^   :Y#&Y    ?@J~~~~^:
 #       P#^  !#G~^B5   J&~      
 #      ?&J  J#5.  ~&J  7@7      
 #     .#B..5#? ..  P#..BB^      
 #     .!! 7G7  ..  !G!:&5       
 #                    . ~^       

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

echo "$(ordinal ${GREEN}${bold}$(date +%j)) ${YELLOW}day"

cal -3
echo "${normal}🌴"
# echo ${(%):-'%F{yellow}%B%b%f'}
echo "${Blue}${bold}$(sb-clock)"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/tat/.oh-my-zsh"

# ZSH_THEME="dracula"
# DRACULA_DISPLAY_CONTEXT=1
# export KEYTIMEOUT=1
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true

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
         vi-mode
         zsh-autosuggestions
         zsh-syntax-highlighting
         fzf
         autojump
         copydir
         copyfile
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

alias packtime="expac --timefmt='%Y-%m-%d %T' '%l\t%n' | sort | tail -n 20"

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

#zsh syntax highlighting dracula 
source /home/tat/.oh-my-zsh/custom/themes/dracu-syntax-highlighting.zsh 

eval "$(starship init zsh)"
eval $(thefuck --alias)

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
