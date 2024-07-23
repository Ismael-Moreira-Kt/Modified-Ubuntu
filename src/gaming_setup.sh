function preparing_installation() {
    echo -e "\n\n"
    echo "Updating the package list..."
    sudo apt update -y && sudo apt upgrade -y 
    sudo apt autoremove -y && sudo apt autoclean -y

    echo -e "\n\n"
    echo "Adding repositories..."
    sudo add-apt-repository ppa:atareao/atareao

    echo -e "\n\n"
    echo "Installing snap..."
    sudo apt install snapd
}



function installation() {
    echo -e "\n\n"
    echo "Updating the package list..."
    sudo apt update -y && sudo apt upgrade -y 
    sudo apt autoremove -y && sudo apt autoclean -y

    echo "Installing CPU-G..."
    sudo apt install -y cpu-g

    echo "Installing flatpak"
    sudo apt install -y flatpak
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
}



function gaming_setup() {
    echo -e "\n\n"
    echo "Preparing for installation..."
    preparing_installation

    clear

    echo "Installing..."
    installation
}