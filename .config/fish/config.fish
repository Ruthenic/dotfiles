alias emsdk_setup ". /home/ruthenic/bin/emsdk/emsdk_env.fish"
pyenv init - | source
zoxide init fish | source

#aliases
alias cd="z"
alias xbps-search="xbps-query -Rs"
alias webos-dev-manager="/home/ruthenic/Applications/webos-dev-manager.AppImage"
alias youtube-dl="yt-dlp"
alias users="python -c \"imp=open('/etc/shadow').readlines();out=[x.split(':')[0] for x in imp];print(out)\""
alias npm="pnpm"
function fullpath
    echo (pwd)/$argv
end
thefuck --alias | source
nvm use latest
clear

#random things
export GPG_TTY=(tty)
