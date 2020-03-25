#! /bin/bash
#! /bin/sh

sudo rm /var/lib/NetworkManager/NetworkManager.state

sudo rmmod wl
echo "Unloading wl..."
sudo modprobe wl
echo "Loading wl..."

sudo systemctl stop NetworkManager
echo "Stopping NetworkManager..."
sudo systemctl start NetworkManager
echo "Starting NetworkManager..."

sudo ip link set wlp2s0 down
echo "Deactivating wireless interface..."
sudo ip link set wlp2s0 up
echo "Activating wireless interface..."
echo "Done..."

echo "Rebooting."
systemctl reboot
