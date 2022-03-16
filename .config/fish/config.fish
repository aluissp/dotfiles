# Greeting
set fish_greeting ""
neofetch

# Aliases

alias grep "grep --color=auto"
alias cat "bat --style=plain --paging=never"
alias ls "exa --group-directories-first"
alias tree "exa -T"
alias pgstart "sudo systemctl start postgresql.service"
alias pgstop "sudo systemctl stop postgresql.service"
alias pgadmin "source pgadmin4/bin/activate.fish"
# alias dotfiles "git --git-dir $HOME/.dotfiles/ --work-tree $HOME"


# Prompt
starship init fish | source
