function preparing_installation() {
    echo -e "\n\n"
    echo "Updating the package list..."
    sudo apt update -y && sudo apt upgrade -y 
    sudo apt autoremove -y && sudo apt autoclean -y

    echo -e "\n\n"
    echo "Installing basic tools..."
    sudo apt install -y git curl gnupg build-essential cabextract p7zip unrar unzip wget zenity


    echo -e "\n\n"
    echo "Adding repositories..."
    sudo add-apt-repository ppa:atareao/atareao
    sudo add-apt-repository ppa:pipewire-debian/pipewire-upstream

    echo -e "\n\n"
    echo "Installing snap..."
    sudo apt install snapd
}



function installation() {
    echo -e "\n\n"
    echo "Updating the package list..."
    sudo apt update -y && sudo apt upgrade -y 
    sudo apt autoremove -y && sudo apt autoclean -y

    echo -e "\n\n"
    echo "Installing CPU-G..."
    sudo apt install -y cpu-g

    echo -e "\n\n"
    echo "Installing flatpak..."
    sudo apt install -y flatpak
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

    echo -e "\n\n"
    echo "Installing Steam..."
    flatpak install flathub com.valvesoftware.Steam

    echo -e "\n\n"
    echo "Installing Lutris..."
    flatpak install flathub net.lutris.Lutris

    echo -e "\n\n"
    echo "Installing Wine..."
    flatpak install flathub org.winehq.Wine

    echo -e "\n\n"
    echo "Installing WineTricks..."
    wget  https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
    chmod +x winetricks 
    sudo mv -v winetricks /usr/local/bin

    echo -e "\n\n"
    echo "Installing Bottles..."
    flatpak install flathub com.usebottles.bottles

    echo -e "\n\n"
    echo "Installing and configuring PipeWire..."
    sudo apt install -y pipewire pipewire-pulse
    sudo apt install -y pipewire-audio-client-libraries
    sudo apt install -y gstreamer1.0-pipewire libspa-0.2-bluetooth libspa-0.2-jack
    systemctl --user stop pulseaudio.service pulseaudio.socket
    systemctl --user disable pulseaudio.service pulseaudio.socket
    systemctl --user mask pulseaudio.service pulseaudio.socket
    systemctl --user enable pipewire.socket pipewire-pulse.socket
    systemctl --user start pipewire.socket pipewire-pulse.socket
}



function gaming_setup() {
    echo -e "\n\n"
    echo "Preparing for installation..."
    preparing_installation

    clear

    echo "Installing..."
    installation
}