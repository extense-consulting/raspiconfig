echo "Installing Server..."
sudo apt-get update
sudo apt-get upgrade -y
sudo rpi-update -y
sudo apt-get install jq -y
curl -sSL https://get.docker.com | sh
sudo systemctl enable docker

echo "Installing ZeroTier..."
curl -s https://install.zerotier.com | sudo bash
sudo zerotier-idtool initmoon identity.public >> /home/pi/moon.json
sudo zerotier-idtool genmoon /home/pi/moon.json
sudo mkdir /var/lib/zerotier-one/moons.d
sudo mv *.moon moons.d/
echo "Your Moon ID: " jq '.id' /home/pi/moon.json

echo "Installing LED Service..."
sudo wget https://raw.githubusercontent.com/extense-consulting/raspiconfig/main/server_led.service -O /lib/systemd/system/led.service
sudo systemctl daemon-reload
sudo systemctl enable led.service
sudo reboot
