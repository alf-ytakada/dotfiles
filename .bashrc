PS1="[\[\033[35m\]\u \[\033[31m\]\h \[\033[36;1;4m\]\w\[\033[0m\]]\n\$ "

# 8系のmysqldumpで5系をdumpするために必要
alias mysqldump='mysqldump --skip-column-statistics'

alias ls='ls -F'
alias sl='ls -F'
alias ll='ls -lF'
alias lls='ll -rSh'
alias llh='ll -h'

alias w='w | sort'
alias l=ll
alias cdo='cd $OLDPWD'
alias dfh='df -h'

alias llt='ll -t'
alias lt='ll -rt'
alias llh='ll -h'
alias rmb='rm *~'

alias grep='grep --colour=auto'

alias gcc99='gcc -std=c99'

alias ffprobe="ffprobe -hide_banner"
alias ffmpeg="ffmpeg -hide_banner"

alias delcom='sed -e "/^#/d; /^$/d;"'

alias lsip='lsof -i -n -P'
alias v="vim"
alias nv="nvim"
alias gs="git status"
alias gsl="git status | less"
alias gc="git commit -m"
alias gco="git checkout"
alias gd="git diff"
alias ga="git add"
alias gb="git branch"
alias gp="git pull --prune"
alias gpu="git push"
alias gdel="git branch --merged|egrep -v '\*|dev|stg|qa|prd|main|master'|xargs git branch -d"

alias d="docker"
alias dc="docker compose"

alias dig="dig +noall +answer"

alias jqjson="jq -r -R 'fromjson? // .'"
alias airjson="air | jq  --unbuffered  -R -r 'fromjson? // .' |  sed -u -e \"s/\\\\\\n/\n/g;s/\\\\\\t/\t/g\" | sed -u -E 's|^\\t.+ghq(/[a-zA-Z0-9._-]+)+|\\x1b[1;37;41m&\\x1b[0m|g'"

shopt -u histappend   # .bash_history追記モードは不要なのでOFFに

HISTSIZE=1000000
HISTFILESIZE=1000000
HISTCONTROL=ignoredups
export HISTSIZE HISTFILESIZE HISTCONTROL
shopt -s no_empty_cmd_completion

HISTTIMEFORMAT='[%Y-%m-%d %T] '; export HISTTIMEFORMAT

# XOFF,XONを無効化 (C-s, C-q)
stty start undef
# disable C-s
if [ -t 0 ]; then
	stty stop undef
fi

shopt -s no_empty_cmd_completion

export LANG=ja_JP.UTF-8


# for fzf setup
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# for source management, Ctrl+g
# https://qiita.com/hidache/items/7dbf0eba2f36f5e1a447
function ghql() {
  local selected_file=$(ghq list --full-path | fzf)
  if [ -n "$selected_file" ]; then
    if [ -t 1 ]; then
      echo ${selected_file}
      cd ${selected_file}
      pwd
    fi
  fi
}

# もとは201だが、日本語入力できなくなるので0を足した
bind -x '"\2010": ghql'
bind '"\C-g":"\2010\C-m"'

alias k="kubectl"
. <(kubectl completion bash)
complete -o default -F __start_kubectl k
alias i="istioctl"
. <(istioctl completion bash)
