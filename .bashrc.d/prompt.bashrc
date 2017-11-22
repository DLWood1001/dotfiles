# vim: set ft=sh:

# Set Prompt 
# ----------
if [ "$PS1_SOURCE_GUARD" != "true" ]; then
   # echo -e '\xF0\x9F\x98\x87'
   PS1="$(echo -e '\xF0\x9F\x98\x88')$PS1"
   PS1_SOURCE_GUARD=true
fi

