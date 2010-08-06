alias g='git'
alias gst='git status'
alias gci='git commit'
alias gco='git checkout'
alias gl='git pull'
alias gp='git push'

alias glo='git pull origin'
alias gpo='git push origin'
alias glom='git pull origin master'
alias gpom='git push origin master'
alias gloc='git pull origin $(current_branch)'
alias gpoc='git push origin $(current_branch)'

alias gld='git pull dropbox'
alias gpd='git push dropbox'
alias gldm='git pull dropbox master'
alias gpdm='git push dropbox master'
alias gldc='git pull dropbox $(current_branch)'
alias gpdc='git push dropbox $(current_branch)'

function git_init_dropbox_bare(){
  GIT_DIR=~/Dropbox/git_private/$1/$2.git git init --bare 
}

function git_add_remote_dropbox(){
  git add remote dropbox ~/Dropbox/git_private/$1/$2.git 
}


function git_clone_from_dropbox(){
  git clone --origin dropbox ~/Dropbox/git_private/$1/$2.git
}

alias gidp='git_init_dropbox_bare projects'
alias gidw='git_init_dropbox_bare applicake'

alias gcdp='git_clone_from_dropbox projects'
alias gcdw='git_clone_from_dropbox applicake'

alias gardp='git_add_remote_dropbox projects'
alias gardw='git_add_remote_dropbox applicake'
