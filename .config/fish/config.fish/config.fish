set fish_plugins rails git node brew rake
set -gx PATH /usr/local/bin ~/bin $PATH

set fish_greeting

set -x DOCKER_TLS_VERIFY 1;
set -x DOCKER_CERT_PATH /Users/rickychiang/.docker/machine/machines/dev;
set -x DOCKER_HOST tcp://192.168.99.100:2376;