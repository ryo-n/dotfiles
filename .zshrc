autoload -U compinit
compinit 

#autoload predict-on
#predict-on

export PATH=/opt/local/bin:/usr/local/bin:/opt/local/sbin:/Application/android-sdk-mac_86/tools:/usr/local/mysql/bin:$PATH

setopt auto_cd 

setopt auto_pushd 

setopt correct 

setopt list_packed 

setopt nolistbeep 

export LANG=ja_JP.UTF-8

case ${UID} in
0)
PROMPT="%B%{[31m%}%/#%{[m%}%b "
PROMPT2="%B%{[31m%}%_#%{[m%}%b "
SPROMPT="%B%{[31m%}%r is correct? [n,y,a,e]:%{[m%}%b "
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
;;
*)
PROMPT="%{[31m%}%/%%%{[m%} "
PROMPT2="%{[31m%}%_%%%{[m%} "
SPROMPT="%{[31m%}%r is correct? [n,y,a,e]:%{[m%} "
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
;;
esac 

case "${TERM}" in
kterm*|xterm)
precmd() {
    echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
}
;;
esac 

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data 

bindkey -e 

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end 
