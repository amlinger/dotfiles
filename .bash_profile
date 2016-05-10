# Make sure we can identify whay what script was used when initialiting
# the prompt.
export BASH_CONF="bash_profile"

# Getting Node in path
export PATH=$PATH:~/.node/current/bin:node_modules/.bin

# Make sure that the home-built scripts are runnable.
export PATH=$PATH":$HOME/bin"

# Getting highlighted cat code.
cat() {
    local out colored
    out=$(/bin/cat $@)
    colored=$(echo $out | pygmentize -f console -g 2>/dev/null)
    [[ -n $colored ]] && echo "$colored" || echo "$out"
}

# Setting up Docker environmen variables
eval "$(docker-machine env dev)"

# Cleaning up docker
docker-clean() {
    docker rm "$(docker ps -a -q)"
    docker images | grep '<none>' | awk '{print $3}' | xargs docker rmi
}

# For setting up Docker Compose:
setup-docker-compose() {
    boot2docker up
    export DOCKER_HOST=tcp://192.168.59.103:2376
    export DOCKER_CERT_PATH=/Users/Amlinger/.boot2docker/certs/boot2docker-vm
    export DOCKER_TLS_VERIFY=1
}

# export GEM_HOME="$HOME/.rbenv/versions/2.2.2/lib/ruby/gems/2.2.0/gems"

# Should add RVM env to the path.
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
