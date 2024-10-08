export GPG_TTY=$(tty)
gpgconf --launch gpg-agent

export SSH_AUTH_SOCK=~/.1password/agent.sock

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

autoload -U bashcompinit
bashcompinit

#* Sheldon
export SHELDON_CONFIG_DIR="$HOME/.sheldon"
export SHELDON_DATA_DIR="$HOME/.sheldon"

export ZSH="$HOME/.sheldon/repos/github.com/ohmyzsh/ohmyzsh"
export NVM_SYMLINK_CURRENT=true


#* Oh My Zsh settings here

plugins=(
  git vscode yarn aws docker ng history-substring-search colored-man-pages pip pyenv python sudo poetry
)


# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'

# Super user
alias _='sudo'

#alias g='grep -in'

# Show history
alias history='fc -l 1'

# List direcory contents
alias lsa='ls -lah'
alias l='ls -la'
alias ll='ls -l'
alias sl=ls # often screw this up

alias afind='ack-grep -il'

alias x=extract

setopt auto_name_dirs
setopt auto_pushd
setopt pushd_ignore_dups

alias ..='cd ..'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd/='cd /'

alias 1='cd -'
alias 2='cd +2'
alias 3='cd +3'
alias 4='cd +4'
alias 5='cd +5'
alias 6='cd +6'
alias 7='cd +7'
alias 8='cd +8'
alias 9='cd +9'
alias gtcd='source  ~/bin/gtcd-script'

cd () {
  if   [[ "x$*" == "x..." ]]; then
    cd ../..
  elif [[ "x$*" == "x...." ]]; then
    cd ../../..
  elif [[ "x$*" == "x....." ]]; then
    cd ../../..
  elif [[ "x$*" == "x......" ]]; then
    cd ../../../..
  else
    builtin cd "$@"
  fi
}

alias md='mkdir -p'
alias rd=rmdir
alias d='dirs -v'

# mkdir & cd to it
function mcd() {
  mkdir -p "$1" && cd "$1";
}


#* Paths
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


#** here we add work specific config

source /Users/benjaminmartinez/repos/work/gh/kavak-config/extended-zsh
export PATH="$PATH:/Users/benjaminmartinez/.kavak/bin"
#---

eval "$(direnv hook zsh)"
eval "$(sheldon source)"
#* prompt
eval "$(starship init zsh)"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# ================== KAVAK RELATED CONFIGURATIONS - BEGIN ========================


# Golang

export GOPROXY="https://$ARTIFACTORY_USERNAME:$ARTIFACTORY_ACCESS_TOKEN@kavak.jfrog.io/artifactory/api/go/go";
export GONOSUMDB="gitlab.com/kavak-it/*";
export PIP_INDEX_URL="https://$ARTIFACTORY_USERNAME:$ARTIFACTORY_ACCESS_TOKEN@kavak.jfrog.io/artifactory/api/pypi/pypi/simple"

# Update path to include the directory where our kavak binary resides

export PATH="$PATH:/Users/benjaminmartinez/.kavak/bin";

# ================== KAVAK RELATED CONFIGURATIONS - END   ========================

# Created by `pipx` on 2023-09-29 18:13:37
export PATH="$PATH:/Users/benjaminmartinez/.local/bin"
eval "$(register-python-argcomplete pipx)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/benjaminmartinez/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

[[ -s "/Users/benjaminmartinez/.gvm/scripts/gvm" ]] && source "/Users/benjaminmartinez/.gvm/scripts/gvm"
