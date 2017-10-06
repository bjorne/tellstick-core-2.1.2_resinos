#!/bin/sh

echo "Installing dependencies..."
docker exec homeassistant apk add --no-cache confuse libftdi1 libstdc++

echo "Copying telldus binaries, libraries and config files..."
docker exec homeassistant cp -R /share/telldus-core/etc /
docker exec homeassistant cp -R /share/telldus-core/usr /
docker exec homeassistant cp -R /share/telldus-core/var /

echo "Adding tellstick.conf in Config dir.."
docker exec homeassistant cp /share/telldus-core/tellstick.conf /config
docker exec homeassistant ln -s /config/tellstick.conf /etc/tellstick.conf

echo "Adding telldusd service to start up on container start..."
docker exec homeassistant awk '/udevadm trigger/ { print; print "telldusd &"; next}1' /usr/bin/entry.sh > /resin-data/share/tempentry.sh
docker exec homeassistant cp /share/tempentry.sh /usr/bin/entry.sh
docker exec homeassistant chmod +x /usr/bin/entry.sh
docker exec homeassistant rm /share/tempentry.sh


echo "Restarting container homeassistant.."
docker restart homeassistant

echo "Done!"
echo "Please wait a few minutes and then reload your hass.io with your browser!"
