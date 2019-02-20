PS1="[\[\033[35m\]\u \[\033[31m\]\h \[\033[36;1;4m\]\w\[\033[0m\]]\n\$ "

alias ls='ls -F'
alias sl='ls -F'
alias ll='ls -lF'
alias lt='ll -t'
alias lls='ll -rSh'
alias llh='ll -h'
alias lr='ll -rt'

alias w='w | sort'
alias l=ll
alias cdo='cd $OLDPWD'
alias dfh='df -h'

alias rmb='rm *~'

alias grep='grep --colour=auto'

alias gcc99='gcc -std=c99'

alias ffprobe="ffprobe -hide_banner"
alias ffmpeg="ffmpeg -hide_banner"

alias delcom='sed -e "/^#/d; /^$/d;"'

alias v="vim"
alias nv="nvim"
alias gs="git status"
alias gc="git commit -m"
alias gd="git diff"
alias ga="git add"

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
export PAGER="lv -c "

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
