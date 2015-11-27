autoload -U compinit
compinit  -u

#autoload predict-on
#predict-on

export PATH=/opt/local/bin:/usr/local/bin:/opt/local/sbin:/Application/android-sdk-mac_86/tools:/usr/local/mysql/bin:$PATH
export LC_ALL='ja_JP.UTF-8'
setopt auto_cd 

setopt auto_pushd 

setopt correct 

setopt list_packed 

setopt nolistbeep 

alias tmux="tmux -2"

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

# ------------------------------
# Look And Feel Settings
# ------------------------------
### Ls Color ###
# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS
# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap
fi
