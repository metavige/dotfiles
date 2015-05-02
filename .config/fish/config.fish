set fish_plugins rails git node brew rake
set -gx PATH /usr/local/bin ~/bin $PATH

set fish_greeting

docker-machine env dev | source 