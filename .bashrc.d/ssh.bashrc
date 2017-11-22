# vim: set ft=sh: 

# Enable SSH Tab Completion 
# -------------------------
if [ -f "~/.ssh/config" ]; then
   complete -W "$(sed -n 's/^Host \(.*\)$/\1/p' <~/.ssh/config | sort -u | tr "\n" " ")" ssh
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

