#!/bin/bash





function preparing_installation() {
    echo -e "\n\n"
    echo "Updating the package list..."
    sudo apt update -y && sudo apt upgrade -y 
    sudo apt autoremove -y && sudo apt autoclean -y
    
    echo -e "\n\n"
    echo "Installing basic tools..."
    sudo apt install -y git curl gnupg build-essential

    echo -e "\n\n"
    echo "Removing unnecessary packages..."
    for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
    
    echo -e "\n\n"
    echo "Configuring Docker..."
    sudo apt-get install ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc
    
    echo -e "\n\n"
    echo "Adding a Docker repository..."
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
}



function development_setup() {
    echo -e "\n\n"
    echo "Preparing for installation..."
    preparing_installation
    
    clear
    
    echo "Installing..."
    installation
}