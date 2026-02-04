#!/bin/bash

# Vpomodoro Linux Installation Script
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APPS_DIR="${HOME}/.local/share/applications"

echo "🚀 Installing Vpomodoro..."

# Create applications directory if it doesn't exist
mkdir -p "$APPS_DIR"

# Copy desktop file
cp "$SCRIPT_DIR/vpomodoro.desktop" "$APPS_DIR/"
echo "✓ Desktop file installed to $APPS_DIR"

# Update desktop database (if available)
if command -v update-desktop-database &> /dev/null; then
    update-desktop-database "$APPS_DIR"
    echo "✓ Desktop database updated"
else
    echo "⚠ update-desktop-database not found (optional)"
fi

# Create symlink for easy access (optional)
INSTALL_DIR="${HOME}/.local/opt/vpomodoro"
if [ ! -d "$INSTALL_DIR" ]; then
    mkdir -p "$INSTALL_DIR"
    ln -s "$SCRIPT_DIR" "$INSTALL_DIR/app"
    echo "✓ Symlink created at $INSTALL_DIR"
fi

echo ""
echo "✅ Installation complete!"
echo ""
echo "You can now launch Vpomodoro from your application menu."
echo "Or open it directly with: xdg-open $SCRIPT_DIR/index.html"
