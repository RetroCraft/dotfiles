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

## WSL ffmpeg
alias ffmpeg-win='/mnt/c/Users/retro/Programs/ffmpeg/bin/ffmpeg.exe -hwaccel auto'

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

## Unlock GPG key
unlockgpg () {
  export GPG_TTY=$(tty)
  printf "lol" \
    | gpg2 --status-fd=2 -bsau 'James Ah Yong <james@retrocraft.ca>' > /dev/null
}

ffrecode () {
  for f in "$@"; do
    ffmpeg -i "$f" "/tmp/${f%.*}.mp4"
    rm "$f"
    mv "/tmp/${f%.*}.mp4" "./${f%.*}.mp4"
  done
}
