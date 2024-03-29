
#  https://fishshell.com/docs/current/index.html

set fish_greeting

# Environment variables - https://fishshell.com/docs/current/cmds/set.html
set -gx EDITOR 'nvim'
set -gx BUNDLER_EDITOR $EDITOR
set -gx MANPAGER 'less -X' # Don’t clear the screen after quitting a manual page
set -gx HOMEBREW_CASK_OPTS '--appdir=/Applications'
set -gx SOURCE_ANNOTATION_DIRECTORIES 'spec'
set -gx RUBY_CONFIGURE_OPTS '--with-opt-dir=/usr/local/opt/openssl:/usr/local/opt/readline:/usr/local/opt/byaml:/usr/# local/opt/gdbm'
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx DOTFILES "$HOME/dotfiles"
# set -gx RIPGREP_CONFIG_PATH "$DOTFILES/ripgreprc"
# set -gx HOST_NAME (scutil --get HostName)
set -gx HOST_NAME RayMac


# FZF specific - https://github.com/junegunn/fzf#key-bindings-for-command-line
set -gx FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --no-ignore-vcs'
set -gx FZF_DEFAULT_OPTS '--height 50% --layout=reverse --border'
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -gx FZF_ALT_C_COMMAND 'fd --type d . --color=never'
set -gx FZF_PREVIEW_COLUMNS (math ceil $COLUMNS \* 0.7)
#
#
#
set -gx GOPATH $HOME/go $HOME/projects
# set -gx GOROOT "/usr/local/opt/go/libexec" # install with brew

# set -gx GOROOT "/usr/local/go"   # install with brew pkg download from golang.org
set -gx GOROOT "/usr/lib/go"
set -gx GOBIN $HOME/go/bin
set -gx GO111MODULE "on"

set -gx PATH ~/bin /usr/local/bin $HOME/.local/bin $PATH
fish_add_path /usr/local/opt/curl/bin
set -gx PATH $GOPATH/bin $PATH
set -gx PATH $GOROOT/bin $PATH
set -gx GOPRIVATE "bitbucket.org/*,frankieone.dev/*"

# set -gx GO2GO_DEST $GOPATH/src/github.com/go2
# set -gx PATH $GO2GO_DEST/bin $PATH
# set -gx GOROOT "$GO2GO_DEST"
# set -gx GO2PATH "$GO2GO_DEST/src/cmd/go2go/testdata/go2path"

# set -gx PASSWORD_STORE_DIR $HOME/github/dotfiles/pass
# set -gx GNUPGHOME $HOME/github/dotfiles/gnupg

# set -gx GIT_AUTHOR_NAME  (pass show del_ml|cut -d@ -f1)
# set -gx GIT_AUTHOR_EMAIL (pass show del_ml)
# set -gx GIT_COMMITTER_NAME (pass show del_ml|cut -d@ -f1)
# set -gx GIT_COMMITTER_EMAIL (pass show del_ml)

set -gx PATH $HOME/.deno/bin $HOME/.yarn/bin $HOME/.config/yarn/global/node_modules/.bin $HOME/.cargo/bin $PATH
set -gx NVM_DIR "$HOME/.nvm"
# # [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# # [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias gvim='/usr/local/bin/mvim'
alias nv='/usr/bin/neovide --nofork --multigrid'
alias nm='/usr/local/bin/nvim -u ~/github/dotfiles/init.min'
alias vdiff='/usr/local/bin/nvim -d -u ~/github/dotfiles/init.min'
alias gdv='git difftool --tool gvimdiff'
alias nd='git difftool --tool nvimdiff'
alias ls='ls --color'
alias ll='ls -lG'
alias icat "kitty +kitten icat"
alias RM='/bin/rm'
set -gx PATH /usr/local/opt/python@3.9/bin $PATH
set -gx PATH /usr/local/opt/llvm/bin /Users/ray.xu/github/dotfiles/bin/ $PATH
#
# # Completion for kitty
# kitty + complete setup fish | source. #fish earlier than 3.0.0,
set -gx TERM_ITALICS true
#
#
set -gx KITTY_LISTEN_ON "unix:/tmp/mykitty-$PPID"
set -gx SKIM_DEFAULT_COMMAND "fd --type f || git ls-tree -r --name-only HEAD || rg --files || find ."

# alias fzf='fzf --preview "bat {} --color=always"'
alias fzb='fzf --preview "bat {} --color=always"'
# alias sk='sk --preview "bat {} --color=always"'  #sk not maintained
# alias seperator="viu `echo ~/photos/$(ls ~/photos |sort -R |tail -1)`'

alias seperator='viu (echo $HOME"/photos/"(ls ~/photos |sort -R |tail -1))'
alias rm='trash-put'

set -gx JAR $HOME/lsp_test/jdt-language-server-1.3.0-202108171748/plugins/# # eclipse.equinox.launcher_1.6.100.v20201223-0822.jar
set -gx GRADLE_HOME $HOME/gradle
set -gx JAVA_HOME /usr/local/Cellar/openjdk/17.0.1/
set -gx JDTLS_HOME $HOME/lsp_test/jdt-language-server-1.3.0-202108171748

set -gx JDTLS_CONFIG $JDTLS_HOME/config_mac
set -gx WORKSPACE $HOME/workspace

set -gx PATH $PATH JAVA_HOME/bin $HOME/software/kafka/kafka_2.11-2.3.0/bin


#
#
#
# 	fish_vi_key_bindings
fish_default_key_bindings -M insert
fish_vi_key_bindings --no-erase insert
# bind \ca beginning-of-line
# bind \ce end-of-line
bind --mode insert \ce end-of-line
bind --mode insert \ca beginning-of-line
if status is-interactive
  # source $XDG_CONFIG_HOME/fish/abbreviations.fish

  # https://github.com/starship/starship#fish
  starship init fish | source
  zoxide init fish | source
  atuin init fish | source
  navi widget fish | source
  # z.lua
  # lua $HOME/bin/z --init fish | source

  # https://asdf-vm.com/#/core-manage-asdf-vm?id=add-to-your-shell
  # source ~/.asdf/asdf.fish


  #set theme_color_scheme gruvbox

  # set -l onedark_options '-b'

  # set_onedark $onedark_options
  # theme_gruvbox dark
  source $XDG_CONFIG_HOME/fish/conf.d/fish_tokyonight_storm.fish

end
fish_add_path /usr/local/opt/ruby/bin
fish_add_path /usr/local/lib/ruby/gems/3.0.0/bin
if status is-login
  ssh-add
end
