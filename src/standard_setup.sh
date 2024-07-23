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

    echo -e "\n\n"
    echo "Installing Snapd..."
    sudo apt install snapd

    echo -e "\n\n"
    echo "Installing Telegram..."
    sudo snap install telegram-desktop

    echo -e "\n\n"
    echo "Installing Gnome Calendar..."
    flatpak install flathub org.gnome.Calendar

    echo -e "\n\n"
    echo "Installing Gnome Contacts..."
    flatpak install flathub org.gnome.Contacts

    echo -e "\n\n"
    echo "Installing KeePassXC..."
    flatpak install flathub org.keepassxc.KeePassXC

    echo -e "\n\n"
    echo "Installing Okular..."
    flatpak install flathub org.kde.okular

    echo -e "\n\n"
    echo "Installing GIMP..."
    flatpak install flathub org.gimp.GIMP

    echo -e "\n\n"
    echo "Installing Inkscape..."
    flatpak install flathub org.inkscape.Inkscape

    echo -e "\n\n"
    echo "Installing VLC..."
    flatpak install flathub org.videolan.VLC

    echo -e "\n\n"
    echo "Installing Spotify..."
    flatpak install flathub com.spotify.Client

    echo -e "\n\n"
    echo "Installing Redshift..."
    sudo apt install -y redshift redshift-gtk

    echo -e "\n\n"
    echo "Installing Deja Dup..."
    sudo snap install deja-dup --classic

    echo -e "\n\n"
    echo "Installing Dropbox..."
    flatpak install flathub com.dropbox.Client

    echo -e "\n\n"
    echo "Installing BleachBit..."
    flatpak install flathub org.bleachbit.BleachBit

    echo -e "\n\n"
    echo "Configuring the firewall..."
    sudo apt install -y ufw
    sudo ufw enable 
    sudo ufw default allow incoming
    sudo ufw default deny outgoing
}



function standard_setup() {
    echo -e "\n\n"
    echo "Installing..."
    installation
}