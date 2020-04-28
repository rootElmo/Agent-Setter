#!/bin/bash

# Created by Elmo Rohula


echo "Installing Git, Salt, and Vim"
sudo apt-get update
sudo apt-get install git salt-minion vim


echo "Setting Vim as sudoeditor"
vimpath=$(sudo update-alternatives --list editor | grep 'vim.basic')

if [[ ${vimpath} != /dev/null ]]
then
	sudo update-alternatives --set editor ${vimpath}	
else
	echo "Could not find path to vim"
fi


echo "Set agent ID and master IP for Salt"
echo "Please give an ID for you agent"
read agentid

echo "Please give master IP:"
read masterip

echo "id: $agentid" | sudo tee /etc/salt/minion 
echo "master: $masterip" | sudo tee -a /etc/salt/minion
