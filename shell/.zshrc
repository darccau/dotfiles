export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="avit"

source $ZSH/oh-my-zsh.sh

plugins=(z git kubectl zsh-autosuggestions zsh-syntax-highlighting web-search colored-man-pages sudo)

export FZF_BASE=/usr/bin/fzf
export PATH=$PATH:$HOME/codeql/
export PATH=$PATH:$HOME/Documents/projects/dotfiles/scripts/

source "/Users/darccu/Documents/projects/dotfiles/shell/.zaliases"
source "/Users/darccu/Documents/projects/dotfiles/shell/.zfunctions"
source "/Users/darccu/Documents/projects/dotfiles/shell/.zenvs"

fpath=(${HOME}/.oh-my-zsh/completions/ $fpath)

export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH
source <(kubectl completion zsh)

 eval "$(zoxide init zsh)"

 function zoxider() {
  BUFFER=$(zoxide query -i)
  zle accept-line
}

zle -N zoxider
bindkey '^j' zoxider
# bun completions
[ -s "/Users/darccu/.bun/_bun" ] && source "/Users/darccu/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.local/bin/:$PATH"
autoload -U compinit; compinit

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
