#!/usr/bin/env bash

mkdir -pv $(brew --prefix)/etc/
echo 'address=/.dev/127.0.0.1' > $(brew --prefix)/etc/dnsmasq.conf
echo "resolv-file=$(brew --prefix)/etc/resolv.dnsmasq.conf" >> $(brew --prefix)/etc/dnsmasq.conf
sudo cp -v $(brew --prefix dnsmasq)/homebrew.mxcl.dnsmasq.plist /Library/LaunchDaemons
sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
sudo mkdir -v /etc/resolver
sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/dev'
