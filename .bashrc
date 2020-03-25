#!/bin/bash

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

##################
# SETTINGS
##################


##################################################
# Hystory settings
##################################################

export BROWSER='firefox'
export EDITOR='gvim'

shopt -s histappend # adds the history of the buffer to the end of the history file ($HISTFILE)

export HISTCONTROL=ignoreboth:erasedups # prevent duplicate entries from being saved in the $HISTFILE

export PROMPT_COMMAND="history -n; history -w; history -c; history -r" # updates the history cache

       # history -n reads all lines from $HISTFILE that may have occurred in a different terminal since the last carriage return
       # history -w writes the updated buffer to $HISTFILE
       # history -c wipes the buffer so no duplication occurs
       # history -r re-reads the $HISTFILE, appending to the now blank buffer

tac "$HISTFILE" | awk '!x[$0]++' > /tmp/tmpfile  && tac /tmp/tmpfile > "$HISTFILE" # stores the first occurrence of each line it encounters. tac reverses it, and then reverses it back so that it can be saved with the most recent commands still most recent in the History

rm /tmp/tmpfile


export HISTFILESIZE=5000
export HISTSIZE=1000


##################
# ENABLE OPTIONS
##################


# shopt options
shopt -s cdspell         # This will correct minor spelling errors in a cd command.
shopt -s checkwinsize    # Check window after each command
shopt -s histappend      # Append History instead of overwriting file
shopt -s cmdhist         # Bash attempts to save all lines of a multiple-line command in the same history entry

################################
# COLORS
################################

#Colors for man pages (more detail):

function _colorman() {
  env \
    LESS_TERMCAP_mb="$(printf "\\e[1;35m")" \
    LESS_TERMCAP_md="$(printf "\\e[1;34m")" \
    LESS_TERMCAP_me="$(printf "\\e[0m")" \
    LESS_TERMCAP_se="$(printf "\\e[0m")" \
    LESS_TERMCAP_so="$(printf "\\e[7;40m")" \
    LESS_TERMCAP_ue="$(printf "\\e[0m")" \
    LESS_TERMCAP_us="$(printf "\\e[1;33m")" \
      "$@"
}
function man() { _colorman man "$@"; }
function perldoc() { command perldoc -n less "$@" |man -l -; }


# use the config at ~/.dircolors if it exists, otherwise generate a new
eval "$( dircolors --sh "$(ls -d ~/.dircolors 2>/dev/null)" )"

# Usage: _ls_colors_add BASE NEW [NEW...]
# Have LS color given NEW extensions the way BASE extension is colored
_ls_colors_add() {
  local BASE_COLOR="${LS_COLORS##*:?.$1=}" NEW
  if [ "$LS_COLORS" != "$BASE_COLOR" ]; then
    BASE_COLOR="${BASE_COLOR%%:*}"
    shift
    for NEW in "$@"; do
      if [ "$LS_COLORS" = "${LS_COLORS#*.$NEW=}" ]; then
        LS_COLORS="${LS_COLORS%%:}:*.$NEW=$BASE_COLOR:"
      fi
    done
  fi
  export LS_COLORS
}

_ls_colors_add zip jar xpi            # archives
_ls_colors_add jpg ico JPG PNG webp   # images
_ls_colors_add ogg opus               # audio (opus now included by default)

if ls -ld --color=auto / >/dev/null 2>&1
  then alias ls="ls -ph --color=auto"
  else alias ls="ls -ph"
fi


#Colors for BASH PROMPT:


###Default color:w

export PS1='\[\e[36m\][\u@\h \W]\$ \[\e(B\e[m\]'


######################################################
# INITIAL SCREEN
######################################################


echo -ne "\\e[1m\\e[93mSYSTEM INFORMATION:";
echo -e "\\e[1m\\e[96m";uname; uname -rm;

echo ""

echo -ne "\\e[1m\\e[93mUPTIME:";
echo -e "\\e[1m\\e[96m";

uptime=$(</proc/uptime)
uptime=${uptime%%.*}

seconds=$(( uptime%60 ))
minutes=$(( uptime/60%60 ))
hours=$(( uptime/60/60%24 ))
days=$(( uptime/60/60/24 ))

echo "$days days, $hours hours, $minutes minutes, $seconds seconds";



echo " "


##################################################################
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    ./etc/bash_completion
fi

alias sudo='sudo '

alias grep='grep --color=auto'

alias npm='npq'

alias pacman='pacmatic'

alias python='python3'

#Disown application from terminal when launched by shell command
PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'disown -a -h'
