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
color-cat() {
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

# Attach a tmux session to every SSH session if there already
# is one, or creates one otherwise.
if [[ "$TMUX" == "" ]] &&
   [[ "$SSH_CONNECTION" != "" ]]; then
    # Attempt to discover a detached session and attach
    # it, else create a new session
    WHOAMI=$(whoami)
    if tmux has-session -t $WHOAMI 2>/dev/null; then
        tmux -2 attach-session -t $WHOAMI
    else
        tmux -2 new-session -s $WHOAMI
    fi
fi



# Should add RVM env to the path.
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

###########
# ALIASES #
###########

# Verify that nvim is installed, and use it in that case.
if hash nvim 2>/dev/null; then
  alias vim=nvim
fi



