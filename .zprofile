
export PATH="$HOME/.npm-global/bin:$HOME/.local/bin:$PATH"
export npm_config_prefix=~/.npm-global

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
#    exec startx
fi

