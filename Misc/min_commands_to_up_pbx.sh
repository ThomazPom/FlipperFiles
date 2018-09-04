sudo su
sudo sed -i -re 's/([a-z]{2}\.)?archive.ubuntu.com|security.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list
sudo apt-get update
apt-get purge lxdm
mv /etc/lxdm /etc/lxdm.orig
apt-get install lxdm
cp /root/pinbox/scripts/pinbox.desktop /etc/xdg/autostart
rm /etc/init.d/pinbox
reboot