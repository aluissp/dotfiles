# Description: Git configuration

# Username and email
git config --global user.name "Luis Perugachi"

git config --global user.email "luisprg05@gmail.com"

# Shortcuts
git config --global alias.s status --short

git config --global alias.lg "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green) (%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
