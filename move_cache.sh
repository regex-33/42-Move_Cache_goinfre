#!/bin/bash

# Define ANSI color codes
GREEN='\033[0;32m'
NC='\033[0m' # No Color


# Parse arguments
if [ "$1" == "--cluster" ]; then
    if [ "$2" == "mac" ]; then
        goinfre_dir="$HOME/goinfre/Apps"
    elif [ "$2" == "dell" ]; then
        goinfre_dir="$HOME/../../sgoinfre/goinfre/Perso/$USER/Apps"
    else
        echo "Invalid argument. Usage: $0 --cluster [mac|dell]"
        exit 1
    fi
else
    echo "Usage: $0 --cluster [mac|dell]"
    exit 1
fi

# Define the directories to move
declare -A dirs_to_move=(
    ["Google"]="$HOME/.config/google-chrome"
    ["JetBrains"]="$HOME/.config/JetBrains"
    ["Mozilla"]="$HOME/.mozilla"
    ["Postman"]="$HOME/.config/Postman"
    ["Spotify"]="$HOME/.config/spotify"
    ["iTerm2"]="$HOME/.config/iterm2"
    ["Code"]="$HOME/.config/Code"
    ["Docker Desktop"]="$HOME/.docker"
    ["BraveSoftware"]="$HOME/.config/BraveSoftware"
    ["Logitech"]="$HOME/.config/logitech"
    ["org.videolan.vlc"]="$HOME/.config/vlc"
    [".vscode"]="$HOME/.vscode"
    [".var"]="$HOME/.var"
    [".npm"]="$HOME/.npm"
    [".local"]="$HOME/.local"
)

# Move directories
for dir in "${!dirs_to_move[@]}"; do
    original_dir="${dirs_to_move[$dir]}"
    goinfre_dir_full="$goinfre_dir/$dir"

    # Create the goinfre directory
    mkdir -p "$goinfre_dir_full"
    rm -rf "$original_dir"

    # Create a symlink to the goinfre directory
    ln -s "$goinfre_dir_full" "$original_dir"
    echo -e "${GREEN}Moved $dir to goinfre :)${NC}"
done

