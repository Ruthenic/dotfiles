#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Aliases
alias ls='/usr/bin/ls --color'
alias lsa="/usr/bin/ls --color -a"
alias lsc="/usr/local/bin/ls --color"
if [ -n $(which zoxide 2> /dev/null) ]; then
	eval "$(zoxide init bash)";
	alias cd="z";
fi
if [ -n $(which pw-jack 2> /dev/null) ]; then
	alias catia="pw-jack catia";
fi
alias raelc="history" 
mkcd() { mkdir $1; cd $1; }
fullpath() { echo `pwd`/$1; }

#Prompt
PS1="\n| \033[0;31m\w\033[0m | \033[0;34m\u\033[0m \`~/.config/bash/gitinfo.sh\` \n\_$ "
