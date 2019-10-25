# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

set bell-style none

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac



#RED='\033[0;31m'
#YELLOW='\033[0;33m'
#BLACK='\033[0;30m'
#GREEN='\033[0;32m'
#BLUE='\[\e[0;34m\]'
#PURPLE='\033[0;35m'
#CYAN='\033[0;36m'
#GRAY='\033[0;37m'
#
#RED_BOLD='\033[1;31m'
YELLOW_BOLD='\[\e[1;33m\]'
#BLACK_BOLD='\033[1;30m'
#GREEN_BOLD='\033[1;32m'
#BLUE_BOLD='\033[1;34m'
#PURPLE_BOLD='\[\e[1;35m\]'
CYAN_BOLD='\[\e[1;36m\]'
#GRAY_BOLD='\033[1;37m'
#
#RED_ITALIC='\033[2;31m'
#YELLOW_ITALIC='\033[2;33m'
#BLACK_ITALIC='\033[2;30m'
#GREEN_ITALIC='\033[2;32m'
#BLUE_ITALIC='\033[2;34m'
#PURPLE_ITALIC='\033[2;35m'
#CYAN_ITALIC='\033[2;36m'
#GRAY_ITALIC='\033[2;37m'

DEFAULT_COLOUR='\[\e[0;39m\]'
DEFAULT_BOLD='\[\e[1;39m\]'

#export PS1="$YELLOW_BOLD[$CYAN_BOLD\u$DEFAULT_BOLD@$CYAN_BOLD\h$DEFAULT_BOLD \W$YELLOW_BOLD]$ $DEFAULT_COLOUR"
export PS1="$YELLOW_BOLD[$CYAN_BOLD\h$DEFAULT_BOLD \W$YELLOW_BOLD]$ $DEFAULT_COLOUR"

LS_COLORS="ow=01;90:di=01;90" export LS_COLORS

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

export PATH=/home/suzanka/.local/bin:$PATH

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# On Windows:
#export DISPLAY=:0
export DISPLAY='localhost:0.0'



###################################################################
#                           ALIASES                               #
###################################################################

alias bsh='vim ~/.bashrc'
alias sbsh='source ~/.bashrc'

alias ll='ls -alFtrh'
alias la='ls -A'
alias l='ls -CF'
alias lx='ls -X' # sort by extension

alias rm='rm -i'
alias cp='cp -ir'
alias mv='mv -i'

alias ..='cd ..'
alias ...='cd ../..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'

alias taito='ssh -X USERNAME@taito.csc.fi'
alias radon='ssh -X USERNAME@radon.chem.helsinki.fi'
alias HY='ssh -X UNI_USERNAME@pangolin.it.helsinki.fi'
alias alcy='ssh -l UNI_USERNAME -tY pangolin.it.helsinki.fi ssh -l UNI_USERNAME -tY alcyone.grid.helsinki.fi'
alias gold='ssh -tY USERNAME@radon.chem.helsinki.fi ssh -l USERNAME -tY gold'

function wiki() { w3m +8 https://en.wiktionary.org/wiki/"$@"; }

#function timelapse() { files=$(ls); i=0; for f in $files; do i=$(($i+1)); mv $f $i.jpg; done; files=$(ls ?.jpg); for f in $files; do mv $f 00$f; done; files=$(ls ??.jpg); for f in $files; do mv $f 0$f; done; }

function untar() {
    name="$@";
    dirname=${name::-7}
    mkdir $dirname
    tar xzvf $name --directory $dirname;
}



# changing the default version of gcc:
# sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7  60

export DISPLAY=localhost:0.0
#export DISPLAY=:0
export LC_AL="en_US.UTF-8" 

# combining pdfs:
# pdftk A=A.pdf B=B.pdf C=C.pdf cat A B C output out.pdf  

# fixing libQt5 problem:
# sudo strip --remove-section=.note.ABI-tag /usr/lib/x86_64-linux-gnu/libQt5Core.so.5

