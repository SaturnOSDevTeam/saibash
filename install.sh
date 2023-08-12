#!/bin/bash


#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"
blackColour="\e[0;30m\033[1m"

function ctrl_c(){
    echo -e "\n\n${redColour}[!] Script Canceled....\n${endColour}"
    tput cnorm; exit 1
}

 echo -e "\n${greenColour}[+]${endColour} ${grayColour}Allo dees is da insstall skeept we install now the AUR${endColour}\n"

sudo pacman -S base-devel git
git clone https://aur.archlinux.org/yay.git 
cd yay
makepkg -si
cd

yay -S picom-git awesome-git acpid git mpd ncmpcpp wmctrl \
firefox lxappearance gucharmap thunar alacritty neovim polkit-gnome \
xdotool xclip scrot brightnessctl alsa-utils pulseaudio jq acpi rofi \
inotify-tools zsh mpdris2 bluez bluez-utils bluez-plugins acpi acpi_call \
playerctl redshift cutefish-cursor-themes-git cutefish-icons upower xorg xorg-init tar

cd 
mkdir .backup_config
cp -r ~/.config/* .backup_config/
cp -r ~/.mpd .backup_config/
cp -r ~/.ncmpcpp .backup_config/
cp -r ~/.themes .backup_config/

cd
git clone --recurse-submodules https://github.com/saimoomedits/dotfiles.git
cd dotfiles

cp -rf .config/* ~/.config/
cp -rf extras/mpd ~/.mpd
cp -rf extras/ncmpcpp ~/.ncmpcpp
cp -rf extras/fonts ~/.fonts
cp -rf extras/scripts ~/.scripts
cp -rf extras/oh-my-zsh ~/.oh-my-zsh

mkdir ~/.themes
cp ./themes/* ~/.themes
cd ~/.themes
tar -xf Awesthetic.tar
tar -xf Cutefish-light-modified.tar
rm Awesthetic.tar Cutefish-light-modified.tar

cd ~/.config/awesome/misc
sudo chmod -R +x *

systemctl --user enable mpd
sudo systemctl enable bluetooth

echo -e "${greenColour}[+]${endColour} ${grayColour}Rebooting...${endColour}"
echo -e "${greenColour}[+]${endColour} ${grayColour}This bash script reboots your system at the end of its installation, make sure to always close and save all applications beforehand, i am not responsible for any lost data.${endColour}"

sudo reboot -f
#This bash script reboots your system at the end of its installation, make sure to always close and save all applications beforehand, i am not responsible for any lost data.
