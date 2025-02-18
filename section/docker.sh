# Rancher Desktop
if [[ -d "$HOME/.rd/bin" ]]; then
    export PATH="$HOME/.rd/bin:$PATH"
fi

alias wipe-all-containers='docker rm -f `docker ps -qa`'
alias wipe-all-images='docker rmi `docker images -q`'
alias docker-free-space='docker rmi `docker images --quiet --filter "dangling=true"`'
