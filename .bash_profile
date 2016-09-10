# Make sure we can identify whay what script was used when initialiting
# the prompt.
export BASH_CONF="bash_profile"

case "$OSTYPE" in
    solaris*) OPERATING_SYSTEM="SOLARIS" ;;
    darwin*)  OPERATING_SYSTEM="OSX" ;; 
    linux*)   OPERATING_SYSTEM="LINUX" ;;
    bsd*)     OPERATING_SYSTEM="BSD" ;;
    *)        OPERATING_SYSTEM="unknown: $OSTYPE" ;;
esac

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

# Cleaning up docker
docker-clean() {
    docker rm "$(docker ps -a -q)"
    docker images | grep '<none>' | awk '{print $3}' | xargs docker rmi
}

# Add envirnonment varables, if such a file exists.
if [ -f env.list ]; then
    source env.list
fi

# OSX specific settings.
if [[ $OPERATING_SYSTEM == "OSX" ]]; then
    # Speed up cursor movement.
    defaults write NSGlobalDomain KeyRepeat -int 1
fi

# Should add RVM env to the path.
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
