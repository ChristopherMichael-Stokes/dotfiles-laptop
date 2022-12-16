# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' menu select=20
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/chris/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

autoload -Uz promptinit
promptinit
prompt walters

#variables
export VISUAL=vim
export EDITOR=vim
export TERM=xterm
#path+=~/.local/share/applications/javacc-5.0/bin/  
path+=~/.local/share/applications/  
#path+=~/.npm-global/bin/

#aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias pacman='pacman --color=auto'
alias zreload='. ~/.zshrc'
alias battery='cat /sys/class/power_supply/BAT1/capacity'
alias rmtrash='rm -r /home/chris/.local/share/Trash/files/* && rm -r /home/chris/.local/share/Trash/info/*'
alias sc='xbacklight ='

#settings
setopt autocd
zstyle ':completion:*' rehash true

#sources

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/doc/pkgfile/command-not-found.zsh

#functions

zsudo() sudo zsh -c "$functions[$1]" "$@"

brightness() {
	if [ $# -eq 0 ] 
	then
		printf "pass a percentage between 20 and 100\n"
	elif [ $1 -le 100 ] && [ $1 -ge 20 ] 
	then
		max_brightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)
		brightness=$( bc -l <<<"$max_brightness*$1/100")
		printf "%.0f\n" $brightness > /sys/class/backlight/intel_backlight/brightness
	else
		printf "pass a percentage between 20 and 100\n"
	fi
}

pdfwords() {
	pdftotext $1 - | wc -w
}

[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
