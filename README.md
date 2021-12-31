# Introduction
Sets-up a Raspberry PI for ZeroTier One Network. You can choose from a Client or ZeroTier One Moon Node install.

**Note** For more information about ZeroTier One Moons, see https://docs.zerotier.com/zerotier/moons/.

# Installation

## Client
curl -sSL https://raw.githubusercontent.com/extense-consulting/raspiconfig/main/client_installer.sh | bash -s <ZEROTIER ONE NETWORK ID>

## Server
curl -sSL https://raw.githubusercontent.com/extense-consulting/raspiconfig/main/server_installer.sh | bash

### After installation
1. `cd /var/lib/zerotier-one`
2. `sudo zerotier-idtool initmoon identity.public >> /home/pi/moon.json`
3. `/var/lib/zerotier-one $ sudo zerotier-idtool genmoon /home/pi/moon.json`
4. `sudo nano /home/pi/moon.json` **Note** Copy the ID of your moon 
4. `sudo mkdir moons.d`
5. `sudo mv <YOUR MOON ID>.moon moons.d/`
6. `sudo rm /home/pi/moon.json`
7. `sudo reboot`
