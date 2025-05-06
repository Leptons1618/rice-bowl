if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8

# Update Path
set PATH $PATH $HOME/.local/bin

# Set pyenv to PATH if it exists
if test -d $HOME/.pyenv/bin
    set -Ux PATH $HOME/.pyenv/bin $PATH
end

# Theme path - check for Windows (WSL) or native Linux path
if test -d "/mnt/c/Users"
    # WSL environment - find the Windows username
    set WIN_USER (ls /mnt/c/Users/ | grep -v "Public\|Default\|defaultuser0\|All Users" | head -n1)
    set THEME_PATH "/mnt/c/Users/$WIN_USER/OneDrive/Documents/PowerShell/Themes/1_shell.omp.json"
    
    # Use fallback if specific theme not found
    if not test -f $THEME_PATH
        set THEME_PATH "/mnt/c/Users/$WIN_USER/Documents/PowerShell/Themes/1_shell.omp.json"
    end
else
    # Native Linux environment
    set THEME_PATH "$HOME/.poshthemes/1_shell.omp.json"
    
    # Use default theme if specific theme not found
    if not test -f $THEME_PATH
        for theme in $HOME/.poshthemes/*.omp.json
            set THEME_PATH $theme
            break
        end
    end
end

# Initialize Oh My Posh with the found theme path
if test -f $THEME_PATH
    oh-my-posh init fish --config $THEME_PATH | source
else
    echo "Warning: Oh My Posh theme not found. Please install Oh My Posh and themes."
end

# Set welcome message empty
# set -g fish_greeting

# fish greeting
function fish_greeting
#    echo 'Hakuna matata, Dodo!' | lolcat
#    fortune | lolcat
end

# Aliases
alias ls 'ls --color=auto'
alias ll 'ls -lav --ignore=..'
alias l 'ls -lav --ignore=.?*'
alias lol="clear && fortune | cowsay -f tux | lolcat"

# Pacman
alias install="sudo pacman -S"
alias update="sudo pacman -Syyu"
alias clearCache="sudo pacman -Sc"
alias uninstall="sudo pacman -R"
alias removePackage="sudo pacman -Rns"

# Clear Terminal
alias cl="clear"

# Alias for neovim
alias nv="nvim"
alias nvc="cd ~/.config/nvim/ && nvim"
alias nvfish="nvim ~/.config/fish/config.fish"

# Find file
alias fh="find ~/ -name $1"

# Ranger
alias r="ranger"

# Automatic overwrite confirmation
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# Git and GitHub
alias gc="git clone"

# Function to open files for editing or viewing
function open_files_for_editing
    for file in $argv
        if command -sq exo-open
            echo "exo-open $file" >&2
            setsid exo-open $file > /dev/null >&1
        else if command -sq xdg-open
            echo "xdg-open $file" >&2
            setsid xdg-open $file > /dev/null >&1
        else
            echo "open_files_for_editing: 'xdg-utils' or 'exo' package is required." >&2
        end
    end
end

# Uncomment the following line if you want to use the open_files_for_editing alias
# alias ef='open_files_for_editing'

# Set FUNCNEST variable
if test -z "$FUNCNEST"
    set -x FUNCNEST 100
end


