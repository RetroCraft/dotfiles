# Weird bug (Microsoft/WSL#1887)
unsetopt BG_NICE
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:/mnt/d/Documents/CodingStuff/scripts/bin"

export EDITOR='nvim'
[ -f ~/.terminalrc ] && source ~/.terminalrc

export DISPLAY=:0

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Antigen
source $HOME/.antigen/antigen.zsh
antigen use oh-my-zsh

# Misc
antigen bundle history

# Set Spaceship ZSH as a prompt
SPACESHIP_PROMPT_ORDER=(
	user dir host
	git hg
	package node ruby
	elixir xcode swift golang
	php rust haskell julia
	docker aws venv conda pyenv
	dotnet ember kubecontext
	exec_time line_sep
	battery jobs exit_code char
)
SPACESHIP_RPROMPT_ORDER=(
	vi_mode
	time
)
SPACESHIP_VI_MODE_COLOR=black
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_PREFIX=''
antigen theme https://github.com/denysdovhan/spaceship-prompt spaceship

# Syntax highlighting
antigen bundle zsh-users/zsh-syntax-highlighting

# Command completion
antigen bundle git
antigen bundle npm
antigen bundle yarn
antigen bundle zsh-users/zsh-completions
autoload -U compinit && compinit

# Command autosuggestions
antigen bundle zsh-users/zsh-autosuggestions

antigen bundle vi-mode
antigen apply

# Keybindings
export KEYTIMEOUT=10
bindkey -M viins 'kj' vi-cmd-mode
bindkey -r '^j'
bindkey '^j' autosuggest-accept # similar to deoplete
# Navigation
bindkey '^[OA' up-line-or-beginning-search
bindkey '^[OB' down-line-or-beginning-search
bindkey -M vicmd 'k' up-line-or-beginning-search
bindkey -M vicmd 'j' down-line-or-beginning-search
