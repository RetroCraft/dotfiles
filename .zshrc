# Weird bug (Microsoft/WSL#1887)
unsetopt BG_NICE
[ -f ~/.profile ] && source ~/.profile
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.gem/ruby/2.5.0/bin" # Add RVM to PATH for scripting
export PATH="$PATH:/opt/gradle/gradle-4.9/bin"
export PATH="$PATH:/mnt/d/Documents/CodingStuff/scripts/bin"
export PATH="$PATH:/usr/bin/vendor_perl"
source /usr/share/nvm/init-nvm.sh

[ -f ~/.cache/wal/sequences ] && cat ~/.cache/wal/sequences

export EDITOR='nvim'
export BROWSER='/usr/bin/firefox'

export RTV_URLVIEWER=$HOME/bin/urlmenu
export RTV_BROWSER=$HOME/bin/urlopen

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Antigen
rm $HOME/.zcompdump
source $HOME/.antigen/antigen.zsh
antigen use oh-my-zsh

# Misc
antigen bundle history

# journal time
spaceship_jtime() {
  spaceship::section \
    "$SPACESHIP_TIME_COLOR" \
    "$SPACESHIP_TIME_PREFIX" \
    "$(jdate -tse journal)" \
    "$SPACESHIP_TIME_SUFFIX"
}

# Set Spaceship ZSH as a prompt
SPACESHIP_PROMPT_ORDER=(
	user dir host
	git hg
	package node ruby
	golang
	php rust haskell
	docker aws venv conda pyenv
	dotnet kubectl
	exec_time line_sep
	battery jobs exit_code char
)
SPACESHIP_RPROMPT_ORDER=(
	vi_mode
	jtime
)
SPACESHIP_CHAR_SUFFIX=' '
SPACESHIP_CHAR_SYMBOL='$'
SPACESHIP_CHAR_SYMBOL_ROOT='#'
SPACESHIP_VI_MODE_COLOR=black
SPACESHIP_TIME_COLOR=yellow
antigen theme https://github.com/denysdovhan/spaceship-prompt spaceship

# Syntax highlighting
antigen bundle zsh-users/zsh-syntax-highlighting

# Command completion
antigen bundle git
antigen bundle npm
antigen bundle yarn
antigen bundle zsh-users/zsh-completions
autoload -U compinit && compinit
autoload zmv

# Command autosuggestions
antigen bundle zsh-users/zsh-autosuggestions

antigen bundle vi-mode
antigen apply

# Keybindings
export KEYTIMEOUT=10
bindkey -M viins 'kj' vi-cmd-mode
bindkey -r '^j'
bindkey '^j' autosuggest-accept # similar to deoplete

function fzf-history {
	BUFFER=$( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -r 's/ *[0-9]*\*? *//' | sed -r 's/\\/\\\\/g' )
}
zle -N fzf-history
bindkey '^k' fzf-history # fzf-powered history search
# Navigation
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey -M vicmd 'k' up-line-or-beginning-search
bindkey -M vicmd 'j' down-line-or-beginning-search
# Dumb defaults
bindkey '^[[3~' delete-char
bindkey -a '^[[3~' delete-char

# MOTD etc
[ -f ~/.terminalrc ] && source ~/.terminalrc
