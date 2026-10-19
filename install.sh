#!/bin/bash
echo "🚀 جاري تثبيت HalawahomDesk..."
APPIMAGE=$(find linux/dist -name "*.AppImage" | head -1)

if [ -z "$APPIMAGE" ]; then
    echo "❌ لم يتم العثور على ملف AppImage"
    exit 1
fi

mkdir -p ~/.local/bin ~/.local/share/applications
cp "$APPIMAGE" ~/.local/bin/HalawahomDesk.AppImage
chmod +x ~/.local/bin/HalawahomDesk.AppImage

cat > ~/.local/share/applications/halawahomedesk.desktop << DESKTOP
[Desktop Entry]
Name=HalawahomDesk
Exec=$HOME/.local/bin/HalawahomDesk.AppImage
Icon=utilities-terminal
Type=Application
Categories=Utility;
Terminal=false
DESKTOP

update-desktop-database ~/.local/share/applications/ 2>/dev/null
echo "✅ تم التثبيت بنجاح! اضغط زر Super (Win) وابحث عن HalawahomDesk"
