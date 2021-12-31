echo "Installing Server..."
sudo apt-get update
sudo apt-get upgrade -y
sudo rpi-update -y
curl -sSL https://get.docker.com | sh
sudo systemctl enable docker
curl -s https://install.zerotier.com | sudo bash
sudo wget https://raw.githubusercontent.com/extense-consulting/raspiconfig/main/server_led.service -O /lib/systemd/system/led.service
sudo systemctl daemon-reload
sudo systemctl enable led.service
sudo reboot
