#!/usr/bin/env bash
set -e

echo "==============================="
echo " Portal 2 Ultra Uninstaller"
echo "==============================="

##################################
# Steam detectie
##################################

if [ -d "$HOME/.steam/debian-installation" ]; then
    STEAM_DIR="$HOME/.steam/debian-installation"
elif [ -d "$HOME/.local/share/Steam" ]; then
    STEAM_DIR="$HOME/.local/share/Steam"
else
    echo "❌ Steam niet gevonden"
    exit 1
fi

##################################
# ultra.cfg verwijderen
##################################

PORTAL2_CFG="$STEAM_DIR/steamapps/common/Portal 2/portal2/cfg/ultra.cfg"

if [ -f "$PORTAL2_CFG" ]; then
    rm -f "$PORTAL2_CFG"
    echo "✅ ultra.cfg verwijderd"
else
    echo "ℹ ultra.cfg niet aanwezig"
fi

##################################
# Launch Options opschonen
##################################

USERDATA_DIR="$STEAM_DIR/userdata"

for user in "$USERDATA_DIR"/*; do
    CONFIG="$user/config/localconfig.vdf"

    if [ -f "$CONFIG" ]; then
        LINE=$(grep '"LaunchOptions"' "$CONFIG" || true)

        if echo "$LINE" | grep -q "+exec ultra.cfg"; then

            sed -i \
            's/[[:space:]]*+exec ultra\.cfg//g' \
            "$CONFIG"

            # dubbele spaties opruimen
            sed -i \
            's/"LaunchOptions"[[:space:]]*"\s*/"LaunchOptions" "/' \
            "$CONFIG"

            echo "✅ Launch option verwijderd"
        else
            echo "ℹ Ultra niet actief — overslaan"
        fi
    fi
done

echo ""
echo "🧹 Uninstall voltooid"
echo "Herstart Steam."
