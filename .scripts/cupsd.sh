#! /bin/bash
#! /bin/sh

sudo systemctl stop org.cups.cupsd.service
sudo systemctl start org.cups.cupsd.service
