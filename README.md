# Windows dotfiles

Tiling desktop for Windows that mirrors my Manjaro/Qtile setup: **komorebi** (tiling WM) + **whkd** (Qtile-like keybinds, `Mod = Alt`) + **komorebi-bar** + **Starship** prompt on PowerShell 7.

This branch (`windows`) is standalone: it shares no history with `main` or `manjaro`, so Linux files never land in a Windows home. Never merge it.

## Quick path

Run everything in **PowerShell 7** unless noted.

1. Install the tools (any shell):

   ```powershell
   winget install Git.Git Microsoft.PowerShell LGUG2Z.komorebi LGUG2Z.whkd Starship.Starship Flameshot.Flameshot Flow-Launcher.Flow-Launcher
   ```

   Flameshot powers the screenshot keybinds; Flow Launcher replaces rofi.

2. Install **Agave Nerd Font**: download `Agave.zip` from [nerd-fonts releases](https://github.com/ryanoasis/nerd-fonts/releases/latest), extract, select all `.ttf` files → right-click → **Install**.

3. Enable long paths (komorebi recommendation) in an **admin** PowerShell:

   ```powershell
   Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name LongPathsEnabled -Value 1
   ```

4. Restore the dotfiles into `$HOME`:

   ```powershell
   git clone --bare https://github.com/aluissp/dotfiles.git $HOME\.dotfiles
   function dotfiles { git --git-dir="$HOME\.dotfiles" --work-tree="$HOME" @args }
   dotfiles config status.showUntrackedFiles no
   dotfiles config core.autocrlf false
   dotfiles config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"

   # Move any pre-existing file that would block checkout to ~/.dotfiles-backup
   dotfiles ls-tree -r --name-only windows | ForEach-Object {
     if (Test-Path "$HOME\$_") {
       New-Item -ItemType Directory -Force (Split-Path "$HOME\.dotfiles-backup\$_") | Out-Null
       Move-Item "$HOME\$_" "$HOME\.dotfiles-backup\$_"
     }
   }
   dotfiles checkout windows
   ```

5. Start the desktop and enable it at login:

   ```powershell
   komorebic start --whkd --bar
   komorebic enable-autostart --whkd --bar
   ```

6. Set **Agave Nerd Font** as the font in Windows Terminal (Settings → Profiles → Defaults → Appearance). This setting is not tracked.

**Expected result**: a new PowerShell 7 window shows the Starship prompt with icons, windows tile automatically, and the bar is visible at the top.

## Tracked files

| File | Purpose |
|------|---------|
| `komorebi.json` | Tiling WM: layouts, gaps, borders, workspaces |
| `komorebi.bar.json` | Status bar: widgets, font (`Agave Nerd Font`, size 12) |
| `applications.json` | Per-app rules (float, ignore, tray apps) |
| `.config/whkdrc` | Keybinds, Qtile-like, `Mod = Alt` |
| `.config/starship.toml` | Prompt, same as the `manjaro` branch |
| `Documents/PowerShell/Microsoft.PowerShell_profile.ps1` | PowerShell 7 profile (`$PROFILE`): Starship init + `dotfiles` function |

## Keybindings

`mod` is the left **Alt** key. Press **mod + i** to show an overlay with every shortcut.

| Key | Action |
| ----------------------- | -------------------------------- |
| **mod + j** | next window (down) |
| **mod + k** | next window (up) |
| **mod + h** | focus window left |
| **mod + l** | focus window right |
| **mod + shift + h** | decrease master |
| **mod + shift + l** | increase master |
| **mod + plus / minus** | resize vertically |
| **mod + shift + j** | move window down |
| **mod + shift + k** | move window up |
| **mod + shift + left / right** | move window left / right |
| **mod + shift + return** | promote window to master |
| **mod + shift + f** | toggle floating |
| **mod + f** | Max layout (stack all windows, cycle with mod + j/k) |
| **mod + g** | MonadTall layout (exits Max) |
| **mod + t** | Matrix / grid layout (exits Max) |
| **mod + ctrl + f** | toggle maximize current window |
| **mod + n** | next layout |
| **mod + shift + n** | previous layout |
| **mod + [1-9]** | Switch to workspace N (1-9) |
| **mod + shift + [1-9]** | Send Window to workspace N (1-9) |
| **mod + period** | Focus next monitor |
| **mod + comma** | Focus previous monitor |
| **mod + w** | kill window |
| **mod + ctrl + r** | reload komorebi config |
| **mod + o** | restart whkd (after editing whkdrc) |
| **mod + ctrl + q** | quit (stops komorebi, whkd and bar) |
| **mod + shift + p** | pause / resume tiling |
| **mod + i** | show shortcuts overlay |
| **mod + return** | terminal (Windows Terminal) |
| **mod + b** | browser (Chrome) |
| **mod + e** | file explorer |
| **mod + s** | screenshot full screen (Flameshot) |
| **mod + shift + s** | screenshot selection (Flameshot) |

`Alt + Tab` keeps its default Windows behavior. The rofi launcher (`mod + m` on Manjaro) is configured as a hotkey inside Flow Launcher.

## Daily use

The `dotfiles` command is defined in the PowerShell profile and works like `git`:

```powershell
dotfiles status                  # only tracked files show up
dotfiles add .config/whkdrc      # track a new or changed file
dotfiles commit -m "fix(whkd): ..."
dotfiles push
```

## Gotchas

| Symptom | Fix |
|---------|-----|
| Keybind change does nothing | whkd does not reload its config by itself: press `Alt+O` |
| `komorebi.json` change not applied | Press `Alt+Ctrl+R` |
| `Alt+F` does not exit fullscreen | By design: exit with `Alt+G` (MonadTall) or `Alt+T` (grid) |
| No Starship prompt | Starship is only configured for PowerShell 7 (`pwsh`), not Windows PowerShell 5.1 |
| Squares instead of icons | The terminal font is not set to Agave Nerd Font (step 6) |
| `checkout` says files would be overwritten | Run the backup loop from step 4 again, then `dotfiles checkout windows` |
