#!/usr/bin/env bash
set -e

echo "==============================="
echo " Portal 2 Ultra Installer"
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
# Portal 2 detectie
##################################

PORTAL2_DIR="$STEAM_DIR/steamapps/common/Portal 2"
CFG_DIR="$PORTAL2_DIR/portal2/cfg"

if [ ! -d "$PORTAL2_DIR" ]; then
    echo "❌ Portal 2 niet gevonden"
    exit 1
fi

##################################
# Config installeren
##################################

mkdir -p "$CFG_DIR"
cp configs/ultra.cfg "$CFG_DIR/ultra.cfg"

echo "✅ ultra.cfg geplaatst"

##################################
# Launch Options veilig beheren
##################################

USERDATA_DIR="$STEAM_DIR/userdata"

for user in "$USERDATA_DIR"/*; do
    CONFIG="$user/config/localconfig.vdf"

    if [ -f "$CONFIG" ]; then
        echo "Steam config gevonden: $CONFIG"

        LINE=$(grep '"LaunchOptions"' "$CONFIG" || true)

        # geen LaunchOptions → niets doen
        if [ -z "$LINE" ]; then
            echo "⚠ LaunchOptions niet gevonden"
            continue
        fi

        # reeds aanwezig → skip
        if echo "$LINE" | grep -q "+exec ultra.cfg"; then
            echo "✔ Ultra reeds actief — geen wijziging"
            continue
        fi

        # bestaande opties behouden en uitbreiden
        sed -i \
        's/"LaunchOptions"[[:space:]]*"\([^"]*\)"/"LaunchOptions" "\1 +exec ultra.cfg"/' \
        "$CONFIG"

        echo "✅ Launch option toegevoegd"
    fi
done

echo ""
echo "🎉 Installatie voltooid"
echo "Herstart Steam."
