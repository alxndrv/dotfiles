# Ensure zinit is installed
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Set prompt
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}%{$fg[blue]%}:%{$fg[magenta]%}%~/%{$fg[red]%}]%{$reset_color%}$%b "

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^[[A' history-search-backward
bindkey '^n' history-search-backward
bindkey '^[[B' history-search-backward

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
HISTDUP=erase
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Install plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

# Configure completions
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLOURS}"

# Source aliases
source "${HOME}/.config/shell/aliases"

# Integrations
eval "$(fzf --zsh)"

# Load local configuration, if exists
[ -f "$HOME/.config/shell/local.sh" ] && source "$HOME/.config/zsh/local.sh"
[ -f "$HOME/.config/zsh/local.zsh" ] && source "$HOME/.config/zsh/local.zsh"
