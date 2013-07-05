#function git(){hub "$@"}

alias g='git'
alias gst='git status'
alias gci='git commit'
alias gam='git commit -am'
alias gco='git checkout'
alias gl='git pull --rebase'
alias gp='git push'
alias gmt='git mergetool -t vimdiff'
alias grhh='git reset --hard HEAD'
alias gcfd='git clean -fd'

alias gcp='git cherry-pick'

alias glo='gl origin'
alias gpo='gp origin'
alias glom='glo master'
alias gpom='gpo master'
alias gloc='glo $(current_branch)'
alias gpoc='gpo $(current_branch)'

alias glog='git log --oneline --decorate --all'
alias glogg='git log --oneline --decorate --all --graph'
alias glogs='git log  --decorate --all --stat'

