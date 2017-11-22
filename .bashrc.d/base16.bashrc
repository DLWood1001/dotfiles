# vim: set ft=sh:

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

