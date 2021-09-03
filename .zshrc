#Drake's Early Shit
#Apparently, P10k removes tty access, so we need to define it up here to fix that
export GPG_TTY=$(tty)

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e
# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  # Update static initialization script if it does not exist or it's outdated, before sourcing it
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind up and down keys
zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.zshhistory
HISTSIZE=1000
SAVEHIST=10000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ruthenic/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#Drake's shit
#Setup Zoxide alias
alias cd="z"

#Setup NVM (Void only distributes 14.x, while upstream is on v16. For some reason.)
#export NVM_DIR="~/.nvm"
#source ~/.nvm/nvm.sh

#Setup $PATH
PATH="$PATH:/home/ruthenic/.local/bin:/usr/share/code"

#Make ZSH highlighting colors more Fish-like
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=blue

#Set up general-use aliases
alias npm="pnpm"
alias xbps-search="xbps-query -Rs"
alias cat="bat"
function fullpath() {
	local fptmp=${PWD}
	for x ($*); do local fptmp="$fptmp/$x"; done
	echo $fptmp
}
function mkcd() {
	mkdir $1
	cd $1
}
