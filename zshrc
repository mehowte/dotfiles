# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="eastwood" # "robbyrussell"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"
   
# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Load all of your custom configurations from zsh-custom
for config_file ($HOME/.zsh-custom/*.zsh) source $config_file

export PATH=/opt/local/bin:/opt/local/sbin:/opt/local/libexec/git-core:/opt/local/lib/postgresql84/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin
                                                                                            
unsetopt auto_name_dirs

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
