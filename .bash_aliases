################
# Simple Aliases
################

# Navigation
alias ll='ls -lah'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'

# Apt
alias agi='sudo apt-get install'
alias agrm='sudo apt-get remove'
alias agu='sudo apt-get update; sudo apt-get upgrade'
alias agc='sudo apt-get autoremove; sudo apt-get autoclean; sudo apt-get clean'

# VIM mode
alias :e='nvim'
alias :q='exit'
alias :wq='exit'
alias vi='nvim'
alias vim='nvim'

# Misc
alias !!='sudo !!'
alias mkdir="mkdir -pv"
alias reboot='sudo /sbin/reboot'
alias wget='wget -c'
alias chrome='google-chrome'
alias df='df -h'
alias du='du -h'

# Fun things
alias kys='shutdown -t 0'
alias stfu='shutup'
alias bye3='i3-msg exit'

#######################
# Tools and Long Things
#######################

## Dotfiles git repository
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

## Disable volume
alias shutup='pactl -- set-sink-mute 0 toggle'

## Alert boxes
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

## Process grep
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'

## MRU Commands
mru () {
  echo "Most used commands:"
  history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10
}

## fzf-powered command history searching
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) \
    | fzf +s --tac \
    | sed -r 's/ *[0-9]*\*? *//' \
    | sed -r 's/\\/\\\\/g' )
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

## CRONTAB
if test -z $CRONTABCMD; then
  # allows to source zshrc twice
  export CRONTABCMD=$(which crontab)
  crontab() {
    if [[ $@ == "-e" ]]; then
      nvim ~/.crontab && $CRONTABCMD ~/.crontab
    else
      $CRONTABCMD $@
    fi
  }
  $CRONTABCMD ~/.crontab
fi

## Journal date
jdate () {
  ARG1=${1:-noura}
  # epochs indexed to 0 = 31 December 2019
  declare -A epochs=( [noura]="1000" )
  EPOCH="${epochs[$ARG1]}"
  printf "$((365*($(date +%Y)-2020) + $(date +%j) + $EPOCH)):$(date +%k%M)\n"
}

## Unlock GPG key
unlockgpg () {
  printf "lol" \
    | gpg2 --status-fd=2 -bsau 'James Ah Yong <james@retrocraft.ca>' > /dev/null
}