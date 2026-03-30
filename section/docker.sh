# Rancher Desktop
if [[ -d "$HOME/.rd/bin" ]]; then
    export PATH="$HOME/.rd/bin:$PATH"
fi

if [[ -x $(command -v podman) ]]; then
    alias docker='podman'
fi

alias docker-stop-all='docker stop `docker ps -q`'
alias docker-kill-all='docker kill `docker ps -q`'
alias docker-free-space='docker rmi `docker images --quiet --filter "dangling=true"`'
