sudo apt-get update
sudo apt-get upgrade -y
sudo rpi-update -y
curl -sSL https://get.docker.com | sh
sudo systemctl enable docker
curl -s https://install.zerotier.com | sudo bash
sudo zerotier-cli join $1
sudo reboot
