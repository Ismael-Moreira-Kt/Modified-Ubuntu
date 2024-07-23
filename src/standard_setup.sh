function preparing_installation() { 
    echo -e "\n\n"
    echo "Updating the package list..."
    sudo apt update -y && sudo apt upgrade -y 
    sudo apt autoremove -y && sudo apt autoclean -y
}



function installation() { 
    echo -e "\n\n"
    echo "Updating the package list..."
    sudo apt update -y && sudo apt upgrade -y 
    sudo apt autoremove -y && sudo apt autoclean -y
}



function standard_setup() {
    echo -e "\n\n"
    echo "Preparing for installation..."
    preparing_installation
    
    clear
    
    echo "Installing..."
    installation
}