# Where the magic happens.
export DOTFILES=~/.dotfiles
export TERM="screen-256color"

 # Set config variables first
GIT_PROMPT_ONLY_IN_REPO=1
#GIT_PROMPT_THEME="Custom"
GIT_PROMPT_START_USER="_LAST_COMMAND_INDICATOR_ ${Blue}\h${ResetColor}: ${Yellow}${PathShort}${ResetColor}"
GIT_PROMPT_THEME=Solarized
source $DOTFILES/vendor/bash-git-prompt/gitprompt.sh

# Add binaries into the path
PATH=$DOTFILES/bin:$PATH
export PATH

# Source all files in "source"
function src() {
  local file
  if [[ "$1" ]]; then
    source "$DOTFILES/source/$1.sh"
  else
    for file in $DOTFILES/source/*; do
      source "$file"
    done
  fi
}

# Run dotfiles script, then source.
function dotfiles() {
  $DOTFILES/bin/dotfiles "$@" && src
}

src