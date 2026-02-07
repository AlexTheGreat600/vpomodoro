#!/bin/bash

# Vpomodoro Linux Uninstallation Script
set -e

APPS_DIR="${HOME}/.local/share/applications"
INSTALL_DIR="${HOME}/.local/opt/vpomodoro"

echo "🗑️  Uninstalling Vpomodoro..."

# Remove desktop file
if [ -f "$APPS_DIR/vpomodoro.desktop" ]; then
    rm "$APPS_DIR/vpomodoro.desktop"
    echo "✓ Desktop file removed"
fi

# Update desktop database (if available)
if command -v update-desktop-database &> /dev/null; then
    update-desktop-database "$APPS_DIR"
    echo "✓ Desktop database updated"
fi

# Remove symlink
if [ -L "$INSTALL_DIR" ]; then
    rm "$INSTALL_DIR"
    echo "✓ Symlink removed"
elif [ -d "$INSTALL_DIR" ]; then
    echo "⚠ $INSTALL_DIR exists but is not a symlink. Skipping removal for safety."
fi

# Remove installation directory if empty
if [ -d "$(dirname "$INSTALL_DIR")" ]; then
    rmdir "$(dirname "$INSTALL_DIR")" 2>/dev/null || true
fi

echo ""
echo "✅ Uninstallation complete!"
echo "Vpomodoro has been removed from your system."
