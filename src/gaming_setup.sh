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
    sudo add-apt-repository ppa:flexiondotorg/mangohud 
    sudo add-apt-repository ppa:libretro/stable

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

    echo -e "\n\n"
    echo "Installing Goverlay, Vkbasalt and MangoHud..."
    sudo apt install -y mangohud vkbasalt goverlay 

    echo -e "\n\n"
    echo "Configuring MangoHud..."
    mkdir -p ~/.config/MangoHud
    echo '
        fps
        cpu_temp
        gpu_temp
        vram
        ram
        cpu_load
        gpu_load

        font_size=24
        position=top-right
        theme=legacy
    ' >> ~/.config/MangoHud/MangoHud.conf

    echo -e "\n\n"
    echo "Installing and configuring GameMode..."
    sudo apt install -y gamemode
    echo '
        [general]
        reaper_freq = 5

        [cpu]
        governor = peerformance

        [gpu]
        apply_gpu_optimizations = true
    ' >> ~./config/gamemode.ini

    echo -e "\n\n"
    echo "Installing RetroArch..."
    sudo apt install -y retroarch

    echo -e "\n\n"
    echo "Installing PPSSPP..."
    flatpak install flathub org.ppsspp.PPSSPP

    echo -e "\n\n"
    echo "Installing Lime3DS..."
    flatpak install flathub io.github.lime3ds.Lime3DS

    echo -e "\n\n"
    echo "Installing PCSX2..."
    flatpak install flathub net.pcsx2.PCSX2

    echo -e "\n\n"
    echo "Installing Discord..."
    flatpak install flathub com.discordapp.Discord

    echo -e "\n\n"
    echo "Installing AntiMicroX..."
    flatpak install flathub io.github.antimicrox.antimicrox
}



function gaming_setup() {
    echo -e "\n\n"
    echo "Preparing for installation..."
    preparing_installation

    clear

    echo "Installing..."
    installation
}