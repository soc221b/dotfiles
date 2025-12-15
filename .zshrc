# system
export LANG=en_US.UTF-8

export EDITOR='vim'


# brew
brew --version > /dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

## starship
brew list starship 1>/dev/null 2>/dev/null || brew install starship
eval "$(starship init zsh)"

## zsh-history-substring-search
brew list zsh-history-substring-search 1>/dev/null 2>/dev/null || brew install zsh-history-substring-search
source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

## node
which node > /dev/null || curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

## nvm
[ ! -d "$HOME/.nvm" ] && git clone https://github.com/nvm-sh/nvm.git $HOME/.nvm && . "$NVM_DIR/nvm.sh" && nvm install --lts && nvm use --lts
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
autoload -U add-zsh-hook
load-nvmrc() {
  nvm use --silent $(node "$HOME/.detect-node-version.js") || nvm install $(node "$HOME/.detect-node-version.js") && nvm use --silent $(node "$HOME/.detect-node-version.js")
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# zsh

## vi-mode
[ ! -d "$HOME/.config/zsh-vi-mode" ] && git clone https://github.com/jeffreytse/zsh-vi-mode.git $HOME/.config/zsh-vi-mode
source $HOME/.config/zsh-vi-mode/zsh-vi-mode.plugin.zsh

## zsh-syntax-highlighting
[ ! -d "$HOME/.config/zsh-syntax-highlighting" ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.config/zsh-syntax-highlighting
source $HOME/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# vim
[ ! -d "$HOME/.vim/bundle/Vundle.vim" ] && git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

# code Visual Studio Code
export VSCODE_PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$VSCODE_PATH$PATH"
