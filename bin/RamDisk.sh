#!/bin/sh

/usr/sbin/diskutil erasevolume HFS+ "RamDisk" `hdiutil attach -owners on -nomount ram://1048576`
/usr/sbin/diskutil enableOwnership /Volumes/RamDisk
chmod o+W /Volumes/RamDisk
mkdir /Volumes/RamDisk/Safari
mkdir /Volumes/RamDisk/Chrome
mkdir /Volumes/RamDisk/Firefox
mkdir /Volumes/RamDisk/Spotify

