# Aliases
alias ls="ls --color=always"
alias l="ls -lah"
alias l.="ls -lah | less -R"
alias p="ps -A"
alias p.="ps -AF | less -R"
alias d="du -hd 1 | sort -h"
alias f="find / -name 2>/dev/null"
alias f.="find . -name 2>/dev/null"
alias ..="cd .."
alias glg="git log"
alias ghi="git log -p -W -S"
alias gci="git commit"
alias gcim="git commit -m"
alias gst="git status"
alias gps="git push"