export STARSHIP_CONFIG=~/.config/starship.toml
export STARSHIP_CACHE=~/.cache/starship/cache

#flutter
export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable

# pet
function prev() {
  PREV=$(fc -lrn | head -n 1)
  sh -c "pet new `printf %q "$PREV"`"
}

function pet-select() {
  BUFFER=$(pet search --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle redisplay
}
zle -N pet-select
stty -ixon
bindkey '^s' pet-select

# mkfile
function mkfile() { mkdir -p "$(dirname "$1")" && touch "$1" ;  }
