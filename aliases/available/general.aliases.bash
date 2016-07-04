cite about-alias
about-alias 'general aliases'

# List directory contents
alias sl=ls
alias ls='ls -G'        # Compact view, show colors
alias la='ls -AF'       # Compact view, show hidden
alias ll='ls -al'

OPERATE_SYSTEM=$(uname)

case $OSTYPE in
    linux*)
        alias ls='ls -aF --color'
        alias ll='ls -al --color | less -r'
        ;;
    *)
        alias ls='ls -aFG'
        alias ll='ls -alG --color | less -r'
        ;;
esac

alias less='less -EmrSw'
alias top='htop'

alias edit="$EDITOR"
alias pager="$PAGER"

alias q='exit'

alias irc="$IRC_CLIENT"

alias cd..='cd ..'         # Go up one directory
alias cd...='cd ../..'     # Go up two directories
alias cd....='cd ../../..' # Go up three directories

# Shell History
alias h='history'

# Tree
if [ ! -x "$(which tree 2>/dev/null)" ]
then
  alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
fi

# Directory
alias md='mkdir -p'
alias rd='rmdir'

# Display whatever file is regular file or folder
catt() {
  for i in "$@"; do
    if [ -d "$i" ]; then
      ls "$i"
    else
      cat "$i"
    fi
  done
}
