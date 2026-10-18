# oh-my-posh init pwsh --config "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/jandedobbeleer.omp.json" | Invoke-Expression
Invoke-Expression (&starship init powershell)

# Bare dotfiles repo (branch: windows)
function dotfiles { git --git-dir="$HOME\.dotfiles" --work-tree="$HOME" @args }
