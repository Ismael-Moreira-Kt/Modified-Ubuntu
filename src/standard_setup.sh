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

    echo -e "\n\n"
    echo "Installing flatpak..."
    sudo apt install -y flatpak
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

    echo -e "\n\n"
    echo "Installing Chrome..."
    flatpak install flathub com.google.Chrome

    echo -e "\n\n"
    echo "Installing Thunderbird..."
    flatpak install flathub org.mozilla.Thunderbird

    echo -e "\n\n"
    echo "Installing Zoom..."
    flatpak install flathub us.zoom.Zoom
}



function standard_setup() {
    echo -e "\n\n"
    echo "Preparing for installation..."
    preparing_installation
    
    clear
    
    echo "Installing..."
    installation
}