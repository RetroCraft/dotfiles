# Setup fzf
# ---------
if [[ ! "$PATH" == */home/jam/.fzf/bin* ]]; then
  export PATH="$PATH:/home/jam/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/jam/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/jam/.fzf/shell/key-bindings.zsh"

