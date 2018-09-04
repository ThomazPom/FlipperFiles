#!/bin/bash

# after executing this script Nucore will be started completely as root

mkdir -p /root/.config/

cp -fr /home/nucore/.config/autostart /root/.config/
cp -fr /home/nucore/.config/lxpanel /root/.config/
cp -fr /home/nucore/.config/pcmanfm /root/.config/

sed -i "s/nucore/root/" /etc/lightdm/lightdm.conf.d/10-lubuntu.conf

