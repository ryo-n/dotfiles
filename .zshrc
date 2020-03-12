autoload -Uz compinit && compinit -i
#compinit  -u

#autoload predict-on
#predict-on

fpath=(/usr/local/share/zsh-completions $fpath)
export PATH=/usr/local/opt/openssl/bin/:/opt/local/bin:/usr/local/bin:/opt/local/sbin:/Application/android-sdk-mac_86/tools:/usr/local/mysql/bin:$PATH
export PATH=$PATH:/usr/local/go/bin:~/go/bin:~/bin
export LC_ALL='ja_JP.UTF-8'
export HOMEBREW_BREWFILE=~/Dropbox/Brewfile
export XDG_CONFIG_HOME=~/.config
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"
setopt auto_cd 

setopt auto_pushd 

setopt correct 

setopt list_packed 

setopt nolistbeep 

alias tmux="tmux -2"
alias time="gtime"
#alias vim="nvim"

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
setopt hist_ignore_all_dups     # ignore duplication command history list
setopt share_history        # share command history data 

bindkey -v

autoload history-search-end
#zle -N history-beginning-search-backward-end history-search-end
#zle -N history-beginning-search-forward-end history-search-end
#bindkey "^P" history-beginning-search-backward-end
#bindkey "^N" history-beginning-search-forward-end 


# ------------------------------
# viins
# ------------------------------

bindkey -M viins '\er' history-incremental-pattern-search-forward
bindkey -M viins '^?'  backward-delete-char
bindkey -M viins '^A'  beginning-of-line
bindkey -M viins '^B'  backward-char
bindkey -M viins '^D'  delete-char-or-list
bindkey -M viins '^E'  end-of-line
bindkey -M viins '^F'  forward-char
bindkey -M viins '^G'  send-break
bindkey -M viins '^H'  backward-delete-char
bindkey -M viins '^K'  kill-line
bindkey -M viins '^N'  down-line-or-history
bindkey -M viins '^P'  up-line-or-history
bindkey -M viins '^R'  history-incremental-pattern-search-backward
bindkey -M viins '^U'  backward-kill-line
bindkey -M viins '^W'  backward-kill-word
bindkey -M viins '^Y'  yank


# ------------------------------
# fzf
# ------------------------------
export FZF_DEFAULT_OPTS='--reverse --border'


function peco-src () {
  local selected_dir=$(ghq list -p | fzf --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^g' peco-src



if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/ryo/.sdkman"
[[ -s "/Users/ryo/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/ryo/.sdkman/bin/sdkman-init.sh"

# zsh-bd
. $HOME/.zsh/plugins/bd/bd.zsh
