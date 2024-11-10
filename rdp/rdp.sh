#! /bin/bash

read -p "what is your username : " username
read -p "what is your password : " passwd
printf '\nCheck https://remotedesktop.google.com/headless  Copy Command Of Debian Linux And Paste Down\n'
read -p "Paste Here: " CRP
read -p "what is your pin : " pin
printf "This script modify by Aung Myo Zaw.Thank you for using this.Wait for installing  \n " >&2
{
sudo useradd -m $username
sudo adduser $username sudo
printf "$username:$passwd" | sudo chpasswd
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd
sudo apt-get update
sudo apt install dbus-x11 -y
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg --install chrome-remote-desktop_current_amd64.deb
printf "32\n1\n1" | sudo apt install --assume-yes --fix-broken
sudo DEBIAN_FRONTEND=noninteractive \
apt install --assume-yes xfce4 desktop-base
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'  
sudo apt install --assume-yes xscreensaver
sudo systemctl disable lightdm.service
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg --install google-chrome-stable_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo apt install nautilus nano -y
sudo apt install xfce4-terminal -y
sudo adduser $username chrome-remote-desktop
} &> /dev/null &&
printf "\nSetup Completed " >&2 ||
printf "\nError Occured " >&2
printf "$pin\n$pin" | su - $username -c """$CRP"""
printf 'Check https://remotedesktop.google.com/access/ \n'
printf 'This is my account www.facebook.com/leebugbountyhunter \n'
printf "service chrome-remote-desktop restart" | su aunglay
