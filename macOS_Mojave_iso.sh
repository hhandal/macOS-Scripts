#!/bin/bash

# Prerequisites:
# macOS Mojave has been downloaded from App Store and its path is /Applications/Install\ macOS\ Mojave.app

# Create a Mojave.dmg
hdiutil create -o /tmp/Mojave -size 6g -volname Mojave -layout SPUD -fs HFS+J

# Mount Mojave.dmg
hdiutil attach /tmp/Mojave.dmg -noverify -mountpoint /Volumes/Mojave

# Create macOS Mojave installer
sudo /Applications/Install\ macOS\ mojave.app/Contents/Resources/createinstallmedia --volume /Volumes/Mojave --nointeraction

# Unmount Mojave Disk
hdiutil detach /volumes/Install\ macOS\ Mojave

# Convert Mojave.dmg file to an iso file
hdiutil convert /tmp/Mojave.dmg -format UDTO -o ~/Desktop/Mojave.cdr

# Rename Mojave.cdr to Mojave.iso and move to Desktop
mv ~/Desktop/Mojave.cdr ~/Desktop/Mojave.iso

# Remove /tmp/Mojave.dmg
rm -rfv /tmp/Mojave.dmg
