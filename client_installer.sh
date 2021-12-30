echo "Installing Client..."
echo "ZeroTier Network ID: " $1
sudo apt-get update
sudo apt-get upgrade -y
sudo rpi-update -y
curl -sSL https://get.docker.com | sh
sudo systemctl enable docker
curl -s https://install.zerotier.com | sudo bash
sudo zerotier-cli join $1
sudo zerotier-cli listnetworks
sudo wget https://raw.githubusercontent.com/extense-consulting/raspiconfig/main/client_led.service /lib/systemd/system/led.service
sudo systemctl enable led.service
sudo reboot
