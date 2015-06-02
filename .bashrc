[ -n "$PS1" ] && source ~/.bash_profile
export EDITOR=vim

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# added by travis gem
[ -f /Users/rickychiang/.travis/travis.sh ] && source /Users/rickychiang/.travis/travis.sh

[ -f ~/.bashrc_docker ] && . ~/.bashrc_docker
