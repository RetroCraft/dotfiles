# Weird bug (Microsoft/WSL#1887)
unsetopt BG_NICE
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:/mnt/d/Documents/CodingStuff/scripts/bin"

export EDITOR='nvim'
source ~/.terminalrc

export DISPLAY=:0

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Antigen
source $HOME/.antigen/antigen.zsh

# Misc
antigen bundle history

# Set Spaceship ZSH as a prompt
SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_TIME_SHOW=true
SPACESHIP_VI_MODE_SHOW=false
antigen theme https://github.com/denysdovhan/spaceship-prompt spaceship

# Syntax highlighting
antigen bundle zsh-users/zsh-syntax-highlighting

# Command completion
antigen bundle git
antigen bundle zsh-users/zsh-autosuggestions

antigen apply
