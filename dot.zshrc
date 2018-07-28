# Oh My ZSH Config
#
#

# -------------------------------------------------------------------
# Exports for terminal commands
# -------------------------------------------------------------------


# Set NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# -------------------------------------------------------------------
# Custom Functions
# -------------------------------------------------------------------

# place this after nvm initialization!
# autoload the .nvmrc
# if found in folder
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# -------------------------------------------------------------------
# Theme
# -------------------------------------------------------------------

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  dir           # Current directory section
  time          # Time stampts section
  # hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  # docker        # Docker section
  # elixir        # Elixir section
  # xcode         # Xcode section
  # swift         # Swift section
  # golang        # Go section
  # php           # PHP section
  # rust          # Rust section
  # haskell       # Haskell Stack section
  # julia         # Julia section
  aws           # Amazon Web Services section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  dotnet        # .NET section
  ember         # Ember.js section
  kubecontext   # Kubectl context section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
  line_sep
)

SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_PREFIX="t: "
SPACESHIP_DIR_PREFIX="dir: "
SPACESHIP_PACKAGE_PREFIX="pkg: "
SPACESHIP_NODE_PREFIX="node: "
SPACESHIP_RUBY_PREFIX="ruby: "
SPACESHIP_DOCKER_PREFIX="dckr: "
SPACESHIP_BATTERY_SHOW=always
SPACESHIP_CHAR_SYMBOL="λ "
SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_EXIT_CODE_PREFIX="("
SPACESHIP_EXIT_CODE_SUFFIX=") "
SPACESHIP_EXIT_CODE_SYMBOL="✘ "
SPACESHIP_EXIT_CODE_COLOR="red"
# -------------------------------------------------------------------
# Aliases
# -------------------------------------------------------------------

# Use hub over git
alias git=hub

# Safty First!
alias 'rm=rm -i'
alias 'mv=mv -i'
alias 'cp=cp -i'
alias 'gr=git rebase -i'


# Git
alias 'glog=git log --graph --abbrev-commit --pretty=oneline --decorate'

# Easier Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Brew
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'

# -------------------------------------------------------------------
# Paths
# -------------------------------------------------------------------

# Brew SBin
export PATH="/usr/local/sbin:$PATH"

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

