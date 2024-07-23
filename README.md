# Modified Ubuntu
This project offers a comprehensive set of Bash scripts to quickly configure an Ubuntu system for general use, development or gaming. The scripts automate the installation of essential tools and applications, making it easy to customize the environment.

<br><br>

## Contents
The project contains three main scripts:

- **Development Setup:** Installs tools and applications needed for development, including Docker, ASDF, Vagrant, HashiCorp, MongoDB, Jenkins, and other development tools.
- **Gaming Setup:** Configures the system for gaming, installing graphics drivers, Wine, Lutris, and popular gaming applications.
- **Standard Setup:** Installs common applications for everyday use, such as a browser, email client, productivity applications, and file management tools.

<br><br>

## Usage
Before running any script, make sure you have superuser privileges (sudo). The script checks that you have sufficient privileges before proceeding with the installation.
<br>
To start the setup, run the main script:

```bash
    chmod +x ubuntu
    sudo ./ubuntu
```

You will be presented with a menu to choose between the configuration options. After selecting an option, the corresponding script will be executed.

<br><br>

## License
This project is licensed under the MIT license. See the `LICENSE` file for more details.