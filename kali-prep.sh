#!/bin/bash
### Requires a tools directory at: /home/kali/tools/

### Downloads the complied CME binary from byt3bl33d3r's Github, requires Python 3.8 to run
function Get-cme() {
    echo ""
    dir=$(pwd)
    cd /home/kali/tools/
    wget https://github.com/byt3bl33d3r/CrackMapExec/releases/download/v5.1.1dev/cme-ubuntu-latest.4.zip
    unzip /home/kali/tools/cme-ubuntu-latest.4.zip
    sudo chmod +x /home/kali/tools/cme
    rm /home/kali/tools/cme-ubuntu-latest.4.zip
    cd $dir
    echo ""
}

### Adds the Sublime Text gpg, add the source repo, and installs from source lists
function install-Sublimetext() {
    echo ""
    dir=$(pwd)
    cd ~
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
    sudo apt-get update
    sudo apt-get install sublime-text
    cd $dir
    echo ""
}

### Clones Foxit's Bloodhound Python tool, installs required dependencies  
function install-pythonBloodHound() {
    echo ""
    dir=$(pwd)
    cd /home/kali/tools/
    git clone https://github.com/fox-it/BloodHound.py
    cd /home/kali/tools/BloodHound.py/
    sudo python setup.py install
    sudo python3 setup.py install
    cd $dir
    echo ""
}

### Clones lgandx's Pcredz files, installs dependencies
function install-Pcredz() {
         echo ""
    dir=$(pwd)
    cd /home/kali/tools/
    git clone https://github.com/lgandx/PCredz
    sudo apt-get install libpcap-dev
    sudo apt-get install python3-pip
    pip3 install Cython
    pip3 install python-libpcap
    cd $dir
    echo "" 
}

### Github repo that contains useful commands and installation procedures
function Clone-ShadowGallery() {
    echo ""
    dir=$(pwd)
    cd /home/kali/tools/
    git clone https://github.com/haxgin/shadow_gallery
    cd $dir
    echo "" 
}

### Clones Chris Truncer's Gnmap Parser script   
function Get-GnmapParser() {
    echo ""
    dir=$(pwd)
    cd /home/kali/tools/
    git clone https://github.com/ChrisTruncer/gnmap-parser
    cd $dir
    echo ""   
}

### Pulls down Aquatone's compiled binary to use for domain flyovers
function Get-Aquatone() {
    echo ""
    dir=$(pwd)
    mkdir /home/kali/tools/Aquatone
    cd /home/kali/tools/Aquatone
    wget https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip
    unzip /home/kali/tools/Aquatone/aquatone_linux_amd64_1.7.0.zip
    rm aquatone_linux_amd64_1.7.0.zip
    cd $dir
    echo ""   
}

PS3="Kali Prep - Pick an option: "
options=("Get CME" "Install SublimeText" "Install Python BloodHound" "Install Pcredz" "Clone ShadowGallery" "Get Gnmap Parser" "Get Aquatone")
select opt in "${options[@]}" "Quit"; do

    case "$REPLY" in

    #Prep
    1) Get-cme;;

    2) install-Sublimetext;;

    3) install-pythonBloodHound;;

    4) install-Pcredz;;
    
    5) Clone-ShadowGallery;;

    6) Get-GnmapParser;;

    7) Get-Aquatone;;

    $(( ${#options[@]}+1 )) ) echo "Get to it!"; break;;
    *) echo "Option doesn't exist. Try another one.";continue;;

    esac
done
