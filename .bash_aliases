################
# Simple Aliases
################

# Navigation
alias ll='ls -lah'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias ~='cd ~'

# Apt
alias agi='sudo apt-get install'
alias agrm='sudo apt-get remove'
alias agu='sudo apt-get update; sudo apt-get upgrade'
alias agc='sudo apt-get autoremove; sudo apt-get autoclean; sudo apt-get clean'

alias pip='sudo -H pip'

# VIM mode
alias :e='emacsclient -t'
alias :q='exit'
alias :wq='exit'

# Misc
alias !!='sudo !!'
alias mkdir="mkdir -pv"
alias reboot='sudo /sbin/reboot'
alias wget='wget -c'
alias vi='vim'
alias chrome='google-chrome'
alias refresh='source /home/james/.bashrc'
alias df='df -h'
alias du='du -h'

# Fun things
alias kys='shutdown -t 0'
alias stfu='shutup'

#######################
# Tools and Long Things
#######################

## Disable volume
alias shutup='amixer -q -D pulse set Master toggle'

## Alert boxes
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

## Process grep
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'

## MRU Commands
mru () {
  echo "Most used commands:"
  history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10
}

## Make dir and jump into it
mcd () {
  mkdir -p $1
  cd $1
}

## Github clone
github () {
  git clone https://github.com/$1/$2
  cd $2
}
