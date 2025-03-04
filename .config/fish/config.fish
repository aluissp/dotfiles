# Greeting
set fish_greeting ""
neofetch >&2

# Aliases

alias grep "grep --color=auto"
alias cat "bat --style=plain --paging=never"
alias ls "exa --group-directories-first"
alias tree "exa -T"
alias pgstart "sudo systemctl start postgresql.service"
alias pgstop "sudo systemctl stop postgresql.service"
alias pgadmin "source pgadmin4/bin/activate.fish"
alias mysqlstatus "sudo systemctl status mysqld.service"
alias mysqlstart "sudo systemctl start mysqld.service"
alias mysqlstop "sudo systemctl stop mysqld.service"
alias apachestatus "sudo systemctl status httpd.service"
alias apachestart "sudo systemctl start httpd.service"
alias apachestop "sudo systemctl stop httpd.service"
alias dotfiles "git --git-dir $HOME/.dotfiles/ --work-tree $HOME"


# Prompt
starship init fish | source

# fzf
fzf_key_bindings

# conda
source /opt/miniconda3/etc/fish/conf.d/conda.fish
