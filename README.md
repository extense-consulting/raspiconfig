# Introduction
Sets-up a Raspberry PI for ZeroTier One Network. You can choose from a Client or ZeroTier One Moon Node install.

**Note** For more information about ZeroTier One Moons, see https://docs.zerotier.com/zerotier/moons/.

# Installation

## Client
curl -sSL https://raw.githubusercontent.com/extense-consulting/raspiconfig/main/client_installer.sh | bash -s <ZEROTIER ONE NETWORK ID>

## Server
curl -sSL https://raw.githubusercontent.com/extense-consulting/raspiconfig/main/server_installer.sh | bash

### After installation
When setting up the server, the MOON ID was communicated. This is required when connecting the clients with the following command:
`sudo zerotier-cli orbit <MOON ID> <MOON ID>` 
