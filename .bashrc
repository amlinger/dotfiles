export BASH_CONF="bashrc"

# Using the brew installed version of PHP.
export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# added by travis gem
[ -f /Users/Amlinger/.travis/travis.sh ] && source /Users/Amlinger/.travis/travis.sh
