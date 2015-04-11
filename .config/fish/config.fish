set fish_plugins rails git node brew rake
set -gx PATH /usr/local/bin ~/bin $PATH

set fish_greeting

eval (docker-machine env dev)