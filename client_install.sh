sudo apt-get update
sudo apt-get upgrade -y
curl -sSL https://get.docker.com | sh
sudo systemctl enable docker
curl -s https://install.zerotier.com | sudo bash
sudo zerotier-cli join af78bf94366d3f6c
sudo reboot
