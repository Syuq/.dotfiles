export STARSHIP_CONFIG=~/.config/starship.toml
export STARSHIP_CACHE=~/.cache/starship/cache

#flutter
export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable

# pet
function prev() {
  PREV=$(fc -lrn | head -n 1)
  sh -c "pet new `printf %q "$PREV"`"
}

function taocl() {
  curl -s https://raw.githubusercontent.com/jlevy/the-art-of-command-line/master/README.md |
    sed '/cowsay[.]png/d' |
    pandoc -f markdown -t html |
    xmlstarlet fo --html --dropdtd |
    xmlstarlet sel -t -v "(html/body/ul/li[count(p)>0])[$RANDOM mod last()+1]" |
    xmlstarlet unesc | fmt -80 | iconv -t US
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

