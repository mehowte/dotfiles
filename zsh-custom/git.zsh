#function git(){hub "$@"}

alias g='git'
alias gst='git status'
alias gci='git commit'
alias gco='git checkout'
alias gl='git pull --rebase'
alias gp='git push'
alias gmt='git mergetool -t vimdiff'

alias glo='gl origin'
alias gpo='gp origin'
alias glom='glo master'
alias gpom='gpo master'
alias gloc='glo $(current_branch)'
alias gpoc='gpo $(current_branch)'

alias gld='gl dropbox'
alias gpd='gp dropbox'
alias gldm='gld master'
alias gpdm='gpd master'
alias gldc='gld $(current_branch)'
alias gpdc='gpd $(current_branch)'

function git_init_dropbox_bare(){
  GIT_DIR=~/Dropbox/michal/git_repos/$1/$2.git git init --bare 
}

function git_add_remote_dropbox(){
  git remote add dropbox ~/Dropbox/michal/git_repos/$1/$2.git 
}

function git_clone_from_dropbox(){
  git clone --origin dropbox ~/Dropbox/michal/git_repos/$1/$2.git
}
alias gidp='git_init_dropbox_bare private'
alias gids='git_init_dropbox_bare sandbox'
alias gidw='git_init_dropbox_bare work'

alias gcdp='git_clone_from_dropbox private'
alias gcds='git_clone_from_dropbox sandbox'
alias gcdw='git_clone_from_dropbox work'

alias gradp='git_add_remote_dropbox private'
alias grads='git_add_remote_dropbox sandbox'
alias gradw='git_add_remote_dropbox work'
