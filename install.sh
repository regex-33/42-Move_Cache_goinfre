#!/bin/bash

# Define ANSI color codes
GREEN='\033[0;32m'
NC='\033[0m' # No Color

if [ "$1" == "--classter" ]; then
    if [ "$2" == "mac" ]; then
        classter="mac"
    elif [ "$2" == "dell" ]; then
        classter="dell"
    else
        echo "Invalid argument. Usage: $0 --classter [mac|dell]"
        exit 1
    fi
else
    echo "Usage: $0 --classter [mac|dell]"
    exit 1
fi

if [ -z "$classter" ]; then
    echo "Class argument is missing. Usage: $0 --classter [mac|dell]"
    exit 1
fi

curl -fsSL https://github.com/regex-33/42-Move_Cache_goinfre/blob/main/move_cache.sh > "$HOME/42-move_cache.sh"

chmod +x "$HOME/42-move_cache.sh"

AUTOSTART_DIR="$HOME/.config/autostart/"
mkdir -p "$AUTOSTART_DIR"

echo "- Setting up Terminal to open automatically"
cat > "$AUTOSTART_DIR/terminal.desktop" << EOF
[Desktop Entry]
Type=Application
Exec=gnome-terminal --title="Move Cache" -- bash -c "\$HOME/42-move_cache.sh --classter $classter ; exec bash"
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[en_US]=Terminal
Name=Terminal
Comment[en_US]=Start Terminal on login
Comment=Start Terminal on login
EOF

echo -e "${GREEN}- Done! ✅${NC}"
echo "- Now, log out and log back in."

