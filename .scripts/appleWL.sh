#! /bin/bash
#! /bin/sh

sudo rm /var/lib/NetworkManager/NetworkManager.state

sudo rmmod wl
echo "Unloading wl..." && sleep 1;
sudo modprobe wl && sleep 1;
echo "Loading wl..." && sleep 1;
sudo systemctl stop NetworkManager
echo "Stopping NetworkManager..." && sleep 1;
sudo systemctl start NetworkManager && sleep 1;
echo "Starting NetworkManager..."
sudo ip link set wlp2s0 down&& sleep 1;
echo "Deactivating wireless interface..."
sudo ip link set wlp2s0 up&& sleep 1;
echo "Activating wireless interface..."
echo "Done..."
sleep 1;
echo "Rebooting."
sleep 1 && systemctl reboot
