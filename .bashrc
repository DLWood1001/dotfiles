# Include Global Bash Resournce File 
# ----------------------------------
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


# Bash Options
# ------------
set -o vi


# Set Prompt 
# ----------
if [ "$PS1_SOURCE_GUARD" != "true" ]; then
   # echo -e '\xF0\x9F\x98\x87'
   PS1="$(echo -e '\xF0\x9F\x98\x88')$PS1"
   PS1_SOURCE_GUARD=true
fi


# Aliases
# -------
alias vi="gvim -v"
alias vim="gvim -v"
alias cls="clear"
alias quit='exit'
alias open='gvfs-open'
alias urxvt='urxvt -backspacekey ""'
alias tclsh='rlwrap -c tclsh'
alias vnclow='vncviewer Encodings=tight FullColor=0 LowColorLevel=2 QualityLevel=5 CompressLevel=9 DotWhenNoCursor=1 SecurityTypes=VncAuth,None PasswordFile=~/.vnc/passwd'
alias vnchigh='vncviewer Encodings=tight FullColor=1 QualityLevel=8 CompressLevel=9 DotWhenNoCursor=1 SecurityTypes=VncAuth,None PasswordFile=~/.vnc/passwd'
alias vnc='vnclow'
alias ip_find="perl -ne 's/^.*?((?:[0-9]{1,3}\.){3}[0-9]{1,3}).*?$/\1/g && print'"
alias ip_grep="perl -ne '/^.*?((?:[0-9]{1,3}\.){3}[0-9]{1,3}).*?$/ && print'"
alias ip_sort="ip_find | sort -n -t . -k 1,1 -k 2,2 -k 3,3 -k 4,4"
alias trim_left="perl -pe 's/^[ \t ]+//'"
alias trim_right="perl -pe 's/[ \t ]+$//'"
alias trim_eol="perl -pe 's/(\n|\r\n)$//'"
alias trim="trim_left | trim_right"
alias cb="xclip -selection clipboard"
alias psed="perl -pe"
alias reboot="~/Scripts/reboot.sh"
alias ftp="lftp"
alias pb="ansible-playbook"


# Enable SSH Tab Completion 
# -------------------------
if [ -f "~/.ssh/config" ]; then
   complete -W "$(sed -n 's/^Host \(.*\)$/\1/p' <~/.ssh/config | sort -u | tr "\n" " ")" ssh
fi


# ActiveTcl Path
# --------------
export TCLLIBPATH="/opt/ActiveTcl-8.5/lib/teapot/package/linux-glibc2.3-x86_64/lib"


# BASE16 Color Scheme
# -------------------
# export BASE16_SCHEME="solarized-dark"
# export BASE16_SCHEME="chalk"
# export BASE16_SCHEME="railscasts"
# export BASE16_AIRLINE_SCHEME="railscasts"
# export BASE16_SCHEME="google"
# export BASE16_SCHEME="twilight"
export BASE16_SCHEME="monokai"
# export BASE16_AIRLINE_SCHEME="twilight"
export BASE16_SHELL="$HOME/Source/base16-shell/scripts/base16-$BASE16_SCHEME.sh"

# Load Theme
if [ -s $BASE16_SHELL ]; then
   source "$BASE16_SHELL"
fi


# Load SSH Key
# ------------
# Note(Dan): This is my lab key, it is unsecure.
LAB_SSH_KEY=~/.ssh/dlwood-hpe
if [[ -f $LAB_SSH_KEY ]]; then
   if [[ `grep -L ENCRYPTED $LAB_SSH_KEY` ]]; then
      ssh-add $LAB_SSH_KEY 1> /dev/null 2> /dev/null
   fi
fi


# Go
# --
export GOPATH=~/Source/go
export PATH=$PATH:$GOPATH:$GOPATH/bin


# Tests
# -----
# Vagrant Exports
export VAGRANT_HOME=$(readlink -f ~/Vagrant)
#export VAGRANT_DEFAULT_PROVIDER=virtualbox


