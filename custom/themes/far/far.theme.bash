# vim: syntax=sh
if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
	export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
	export TERM=xterm-256color
fi

function git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
    echo "("${ref#refs/heads/}") ";
}

function git_since_last_commit {
    now=`date +%s`;
    last_commit=$(git log --pretty=format:%at -1 2> /dev/null) || return;
    seconds_since_last_commit=$((now-last_commit));
    minutes_since_last_commit=$((seconds_since_last_commit/60));
    hours_since_last_commit=$((minutes_since_last_commit/60));
    minutes_since_last_commit=$((minutes_since_last_commit%60));
    echo "${hours_since_last_commit}h${minutes_since_last_commit}m ";
}

function git_diff() {
    git diff --no-ext-diff -w "$@" | vim -R -
}

#
# PROMPT
# more info:
# bash manual, section PROMPTING
# $ man bash
# /^PROMPTING
#
# for the prompt there are quite a few 
# backslash-escaped special characters:
#       \@!#$[] ADHTVW adehjlnrstuvw
# here are the most commonly used ones:
# \u    username
# \h    hostname (without the domain)
# \H    full hostname, ie with domain
# \v    version (short)
# \V    version + patch level
# \w    full working directory
# \W    basename of working directory
#
# 37 = white      33 = yellow
# 30 = black      34 = blue
# 31 = red        35 = pink
# 32 = green      36 = cyan
#
RED="\[\033[31m\]"
GREEN="\[\033[32m\]"
YELLOW="\[\033[33m\]"
BLUE="\[\033[34m\]"
PINK="\[\033[35m\]"
CYAN="\[\033[36m\]"
WHITE="\[\033[37m\]"
BOLD="\[\]"
RESET="\[\033[m\]"

export RED
export GREEN
export YELLOW
export BLUE
export PINK
export CYAN
export WHITE
export BOLD
export RESET

export PS1="${CYAN}\A${RESET} ${GREEN}\u${RESET}@${CYAN}\h${RESET}:[${GREEN}\w${RESET}] ${PINK}\$(git_branch) ${YELLOW}\$(git_since_last_commit)${RESET}~\n$ "
export PS2="${BLUE}→ ${RESET}"

export LESS="-EfmrSwX"
# Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"
# For colourful man pages (CLUG-Wiki style)
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_TIME=en_US.UTF-8

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

export LS_COLORS='no=0:fi=0:di=32:ln=36:or=1;40:mi=1;40:pi=31:so=33:bd=44;37:cd=44;37:ex=35:*.jpg=1;32:*.jpeg=1;32:*.JPG=1;32:*.gif=1;32:*.png=1;32:*.jpeg=1;32:*.ppm=1;32:*.pgm=1;32:*.pbm=1;32:*.c=1;33:*.C=1;33:*.h=1;33:*.cc=1;33:*.awk=1;33:*.pl=1;33:*.gz=1;31:*.tar=1;31:*.zip=1;31:*.lha=1;31:*.lzh=1;31:*.arj=1;31:*.tgz=1;31:*.taz=1;31:*.html=1;34:*.htm=1;34:*.doc=1;34:*.txt=1;34:*.o=1;36:*.a=1;36'

export LSCOLORS='gxfxbEaEBxxEhEhBaDaCaD'
