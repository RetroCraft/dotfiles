# MOTD etc
[ -f ~/.terminalrc ] && source ~/.terminalrc

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Weird bug (Microsoft/WSL#1887)
unsetopt BG_NICE
setopt HIST_IGNORE_SPACE
[ -f ~/.profile ] && source ~/.profile
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$PATH:$HOME/.gem/ruby/3.0.0/bin:/usr/lib/ruby/gems/3.0.0/bin"
export PATH="$PATH:/opt/gradle/gradle-4.9/bin"
export PATH="$PATH:/usr/bin/vendor_perl"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

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

antigen theme romkatv/powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# # Syntax highlighting
antigen bundle zsh-users/zsh-syntax-highlighting

# # Command completion
antigen bundle zsh-users/zsh-completions
autoload -U compinit && compinit
autoload zmv

# # Command autosuggestions
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

pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# opam configuration
test -r /home/jam/.opam/opam-init/init.zsh && . /home/jam/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

