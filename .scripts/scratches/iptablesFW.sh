#! /bin/bash
#! /bin/sh

sudo iptables -N TCP
sudo iptables -N UDP
sudo iptables -P FORWARD DROP
sudo iptables -P OUTPUT ACCEPT
sudo iptables -P INPUT DROP
sudo iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A INPUT -m conntrack --ctstate INVALID -j DROP
sudo iptables -A INPUT -p icmp --icmp-type 8 -m conntrack --ctstate NEW -j ACCEPT
sudo iptables -A INPUT -p udp -m conntrack --ctstate NEW -j UDP
sudo iptables -A INPUT -p tcp --syn -m conntrack --ctstate NEW -j TCP
sudo iptables -A INPUT -p udp -j REJECT --reject-with icmp-port-unreachable
sudo iptables -A INPUT -p tcp -j REJECT --reject-with tcp-reset
sudo iptables -A INPUT -j REJECT --reject-with icmp-proto-unreachable
sudo iptables-save > /etc/iptables/iptables.rules
