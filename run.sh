#!/bin/bash

# Created by Elmo Rohula


echo "Installing Git, Salt, openssh-server, and Vim"
sudo apt-get update
sudo apt-get install git salt-minion vim openssh-server


echo "Setting Vim as sudoeditor"
vimpath=$(sudo update-alternatives --list editor | grep 'vim.basic')

if [[ ${vimpath} != /dev/null ]]
then
	sudo update-alternatives --set editor ${vimpath}	
else
	echo "Could not find path to vim"
fi


echo "Set agent ID and master IP for Salt"
echo "Please give an ID for you agent:"
read AGENTID

echo "Please give master IP:"
read MASTERIP

echo "id: $AGENTID" | sudo tee /etc/salt/minion 
echo "master: $MASTERIP" | sudo tee -a /etc/salt/minion

echo "Restarting salt-minion"
sudo systemctl restart salt-minion.service
