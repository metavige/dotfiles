#!/bin/sh

cp -R ~/Library/Caches/com.apple.Safari/* /Volumes/RamDisk/com.apple.Safari/
rm -Rf ~/Library/Caches/com.apple.Safari

cp -R ~/Library/Caches/Google/Chrome/Default/Cache/* /Volumes/RamDisk/Google
rm -Rf ~/Library/Caches/Google/Chrome/Default/Cache

ln -s /Volumes/RamDisk/Google ~/Library/Caches/Google/Chrome/Default/Cache
ln -s /Volumes/RamDisk/com.apple.Safari ~/Library/Caches/com.apple.Safari