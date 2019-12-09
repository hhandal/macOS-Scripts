#!/bin/bash

# Prerequisites:
# Catalina has been downloaded from App Store and its path is /Applications/Install\ macOS\ Catalina.app

# Create a .dmg for Catalina
hdiutil create -o /tmp/Catalina -size 8500m -volname Catalina -layout SPUD -fs HFS+J

# Mount Catalina.dmg
hdiutil attach /tmp/Catalina.dmg -noverify -mountpoint /Volumes/Catalina

# Create macOS Catalina Installer
sudo /Applications/Install\ macOS\ Catalina.app/Contents/Resources/createinstallmedia --volume /Volumes/Catalina/ --nointeraction

# Unmount Catalina Disk
hdiutil detach /volumes/Install\ macOS\ Catalina

# Convert Catalina.dmg file to an iso file
hdiutil convert /tmp/Catalina.dmg -format UDTO -o ~/Desktop/Catalina.cdr

# Rename Catalina.cdr to Catalina.iso and move to Desktop
mv ~/Desktop/Catalina.cdr ~/Desktop/Catalina.iso

# Remove /tmp/Catalina.dmg
rm -rfv /tmp/Catalina.dmg
