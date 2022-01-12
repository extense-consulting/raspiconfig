sudo apt-get update
sudo apt-get upgrade
sudo apt-get install tor obfs4proxy nyx -y

sudo setcap cap_net_bind_service=+ep /usr/bin/obfs4proxy
sudo systemctl daemon-reload
sudo systemctl stop tor@default.service

sudo cp /etc/tor/torrc /etc/tor/torrc.bak

sudo echo "RunAsDaemon 1" >> /etc/tor/torrc
sudo echo "ORPort 5000 IPv4Only" >> /etc/tor/torrc
sudo echo "ExtORPort auto" >> /etc/tor/torrc
sudo echo "BridgeRelay 1" >> /etc/tor/torrc
sudo echo "PublishServerDescriptor 0" >> /etc/tor/torrc
sudo echo "ServerTransportPlugin obfs4 exec /usr/bin/obfs4proxy" >> /etc/tor/torrc
sudo echo "ServerTransportListenAddr obfs4 0.0.0.0:4433" >> /etc/tor/torrc
sudo echo "DNSPort 127.0.0.1:53" >> /etc/tor/torrc
sudo echo "Nickname $1" >> /etc/tor/torrc

sudo systemctl start tor@default.service
