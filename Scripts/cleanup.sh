#!/bin/bash

echo "=============================="
echo " Linux Disk Cleanup Script"
echo "=============================="

# Show disk usage before
echo -e "\n📊 Disk usage BEFORE cleanup:"
df -h /

echo -e "\n🧹 Cleaning package cache..."
sudo apt clean
sudo apt autoclean

echo -e "\n🗑 Removing unused packages..."
sudo apt autoremove -y --purge

# Flatpak cleanup (only if installed)
if command -v flatpak &> /dev/null; then
    echo -e "\n📦 Removing unused Flatpak runtimes..."
    flatpak uninstall --unused -y
fi

echo -e "\n🖼 Clearing thumbnail cache..."
rm -rf ~/.cache/thumbnails/*

echo -e "\n📄 Clearing user cache (safe)..."
rm -rf ~/.cache/*

echo -e "\n📜 Cleaning old journal logs..."
sudo journalctl --vacuum-time=7d

echo -e "\n🗑 Removing temporary files..."
sudo rm -rf /tmp/*

# Show disk usage after
echo -e "\n📊 Disk usage AFTER cleanup:"
df -h /

echo -e "\n✅ Cleanup completed successfully!"

