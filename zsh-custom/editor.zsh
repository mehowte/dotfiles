EDITOR=(mvim -f -c "au VimLeave * !open -a iTerm")
export EDITOR
export GIT_EDITOR='mvim -f -c"au VimLeave * !open -a iTerm"'
export BUNDLER_EDITOR='mvim -f -c"au VimLeave * !open -a iTerm"'

alias v='mvim -c"au VimLeave * !open -a iTerm"'

alias vd='v -c "cd ~/code/github/mehowte/dotfiles"'
alias rz='source ~/.zshrc'
