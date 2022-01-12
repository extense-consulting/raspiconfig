sudo apt-get update
sudo apt-get upgrade
sudo apt-get install tor obfs4proxy nyx -y

sudo setcap cap_net_bind_service=+ep /usr/bin/obfs4proxy
sudo systemctl daemon-reload
sudo systemctl stop tor@default.service

sudo cp /etc/tor/torrc /etc/tor/torrc.bak

echo "RunAsDaemon 1" | sudo tee -a /etc/tor/torrc > /dev/null
echo "ORPort 5000 IPv4Only" | sudo tee -a /etc/tor/torrc > /dev/null
echo "ExtORPort auto" | sudo tee -a /etc/tor/torrc > /dev/null
echo "BridgeRelay 1" | sudo tee -a /etc/tor/torrc > /dev/null
echo "PublishServerDescriptor 0" | sudo tee -a /etc/tor/torrc > /dev/null
echo "ServerTransportPlugin obfs4 exec /usr/bin/obfs4proxy" | sudo tee -a /etc/tor/torrc > /dev/null
echo "ServerTransportListenAddr obfs4 0.0.0.0:4433" | sudo tee -a /etc/tor/torrc > /dev/null
echo "DNSPort 127.0.0.1:53" | sudo tee -a /etc/tor/torrc > /dev/null
echo "Nickname $1" | sudo tee -a /etc/tor/torrc > /dev/null

sudo systemctl start tor@default.service
