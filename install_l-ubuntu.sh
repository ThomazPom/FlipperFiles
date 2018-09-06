#bin/bash
echo -e "\e[92m This script installs a working nucore on lubuntu/ubuntu \e[39m"	

echo -e "\e[92m This script is probaly compatible with some other distros from canonical \e[39m"	

echo -e "\e[92m This script will try to get nucore working even if the system is x64 \e[39m"	


echo -e "\e[92m This script is provided without any garantee \e[39m"	

base_dir=`dirname "$(readlink -f "$0")"` 
echo "Script dir is $base_dir"
sudo gdebi "$base_dir/Files/Lubuntu_packages/nucore-2.25.3r-package-v003-wahcade.deb" -n
sudo gdebi "$base_dir/Files/Lubuntu_packages/nucore-lubuntu-system-configuration-package-v003-wahcade.deb" -n

cat "$base_dir/Roms/Nucore/nucore-roms.tar.gz.0"*>/tmp/nucore-roms.tar.gz
tar -xvxf /tmp/nucore-roms.tar.gz -C ~/nucore

if [[ `uname -m` = "x86_64" ]]; then
	#statements
	echo -e "\e[92mx64 system detected\e[39m"
	sudo dpkg --add-architecture i386
	sudo apt-get update -yq
	sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 libsdl-image1.2:i386 libstdc++5:i386 libvorbisfile3:i386  -yq

fi
sudo chmod +x ~/nucore/scripts/*.sh
echo -e "\e[92mInstall done\e[39m"
echo
echo -e "\e[92m Do you want to enable Nucore on startup now ? \e[39m"
read -p "(y for yes) =>" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	
	echo -e "\e[92mEnabling nucore at startup now\e[39m"
	sudo ~/nucore/scripts/autostart-enable.sh
	echo -e "\e[92mRun  ~/nucore/scripts/autostart-disable.sh to disable it later\e[39m"
else
	echo -e "\e[92mNot enabling nucore at startup now."
	sudo ~/nucore/scripts/autostart-disable.sh
	echo -e "\e[92mRun  ~/nucore/scripts/autostart-enable.sh to enable it later\e[39m"
fi
echo 
echo -e "\e[92m Do you want to reboot now ? \e[39m"
read -p "(y for yes) =>" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo -e "\e[92mWell done ! Installation complete. Rebooting in 3 seconds\e[39m"
	sleep 3;
	sudo reboot
else
	echo -e "\e[92mWell done ! Installaion complete. Not rebooting now\e[39m"
fi

