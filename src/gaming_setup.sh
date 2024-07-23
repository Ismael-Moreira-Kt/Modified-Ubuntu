function preparing_installation() {
    echo -e "\n\n"
    echo "Updating the package list..."
    sudo apt update -y && sudo apt upgrade -y 
    sudo apt autoremove -y && sudo apt autoclean -y

    echo -e "\n\n"
    echo "Adding repositories..."
    sudo add-apt-repository ppa:atareao/atareao
}



function installation() {
    echo -e "\n\n"
    echo "Updating the package list..."
    sudo apt update -y && sudo apt upgrade -y 
    sudo apt autoremove -y && sudo apt autoclean -y

    echo "Installing CPU-G..."
    sudo apt install -y cpu-g
}



function gaming_setup() {
    echo -e "\n\n"
    echo "Preparing for installation..."
    preparing_installation

    clear

    echo "Installing..."
    installation
}