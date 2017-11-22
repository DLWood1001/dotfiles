# vim: set ft=sh: 

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

