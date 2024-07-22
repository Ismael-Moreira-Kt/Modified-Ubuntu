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

        
    echo -e "\n\n"
    echo "Adding repositories for Vagrant, HashiCorp, Snap, MongoDB, Jenkins..."
    wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    
    echo -e "\n\n"
    sudo apt update
    sudo apt install snapd
    
    echo -e "\n\n"
    echo "Configuring MongoDB..."
    curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg --dearmor
    echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
    
    echo -e "\n\n"
    echo "Configuring Jenkins..."
    sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
    echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
}



function installation() {
    echo -e "\n\n"
    echo "Updating the package list..."
    sudo apt update -y && sudo apt upgrade -y 
    sudo apt autoremove -y && sudo apt autoclean -y
    
    echo -e "\n\n"
    echo "Installing ASDF..."
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
    echo '. "$HOME/.asdf/asdf.sh"' >> ~/.bashrc
    echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.bashrc

    echo -e "\n\n"
    echo "Installing other tools..."
    sudo apt install -y cmake docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin vagrant virtualbox virtualbox-ext-pack code postgresql mongodb-org nginx htop glances logrotate valgrind strace wireshark jenkins wine64 flatpak
    
    echo -e "\n\n"
    echo "Starting and enabling services..."
    sudo systemctl start postgresql
    sudo systemctl enable postgresql
    sudo systemctl start mongod
    sudo systemctl enable mongod
}



function development_setup() {
    echo -e "\n\n"
    echo "Preparing for installation..."
    preparing_installation
    
    clear
    
    echo "Installing..."
    installation
}