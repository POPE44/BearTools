#!/bin/bash
VERSION="0"
LINE="------------"

echo -e "                 
 ______   _        _______  _______  _          ______   _______  _______  _______   _________ _______  _______  _        _______ 
(  ___ \ ( \      (  ___  )(  ____ \| \    /\  (  ___ \ (  ____ \(  ___  )(  ____ )  \__   __/(  ___  )(  ___  )( \      (  ____ \
| (   ) )| (      | (   ) || (    \/|  \  / /  | (   ) )| (    \/| (   ) || (    )|     ) (   | (   ) || (   ) || (      | (    \/
| (__/ / | |      | (___) || |      |  (_/ /   | (__/ / | (__    | (___) || (____)|     | |   | |   | || |   | || |      | (_____ 
|  __ (  | |      |  ___  || |      |   _ (    |  __ (  |  __)   |  ___  ||     __)     | |   | |   | || |   | || |      (_____  )
| (  \ \ | |      | (   ) || |      |  ( \ \   | (  \ \ | (      | (   ) || (\ (        | |   | |   | || |   | || |            ) |
| )___) )| (____/\| )   ( || (____/\|  /  \ \  | )___) )| (____/\| )   ( || ) \ \__     | |   | (___) || (___) || (____/\/\____) |
|/ \___/ (_______/|/     \|(_______/|_/    \/  |/ \___/ (_______/|/     \||/   \__/     )_(   (_______)(_______)(_______/\_______)
                                         version: $VERSION -by Grizz "
echo $LINE
echo "Installing Tools - This might take a while"
echo $LINE
echo "Updating Your Os"

sudo apt-get update && sudo apt-get upgrade
sudo apt-get install -y python3-pip
sudo apt-get install -y wget
sudo apt-get install -y git

echo "DONE"
echo $LINE

cd "$HOME" || return 
mkdir Phishing
echo " --- Installing Phishing tools ---"

cd Phishing || return
apt update ; apt install git -y ; git clone git://github.com/htr-tech/nexphisher.git ; cd nexphisher ; bash setup 
cd "$HOME" || return 

echo "Installing Social Phish"
sudo apt-get install python3 python3-pip python3-dev -y
cd Phishing || return 
git clone https://github.com/UndeadSec/SocialFish.git
cd SocialFish || return
python3 -m pip install -r requirements.txt
cd "$HOME" || return 




cd "$HOME" || return 
mkdir tools

echo " --- Installing python3 tools ---"

echo "Installing SQLmap"
cd tools || return
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
cd sqlmap-dev
sudo printf "%s\n" "alias sqlmap="python3 "$HOME"/tools/sqlmap-dev/sqlmap.py"" >> ~/.bashrc
cd "$HOME" || return 

echo "Installing XSSer"
sudo pip3 install pycurl bs4 pygeoip gobject cairocffi selenium
cd tools || return 
git clone https://github.com/epsylon/xsser
cd xsser || return
sudo python3 setup.py
cd "$HOME" || return 

echo "Installing wfuzz" 
sudo pip3 install wfuzz

echo "Installing knockpy ---> More setup will be required"
sudo apt-get install -y python-dnspython
cd tools || return 
git clone https://github.com/guelfoweb/knock.git
cd knock || return 
echo " SET YOUR OWN VIRUSTOTAL KEY WITH THE COMMAND: nano knockpy/config.json"
sudo python setup.py install
cd "$HOME" || return 

echo "Installing Zeus Scanner"
sudo apt-get install libxml2-dev libxslt1-dev python-dev &&  git clone https://github.com/ekultek/zeus-scanner.git && cd zeus-scanner && sudo pip2 install -r requirements.txt 
cd tools || return 
cd "$HOME" || return 


echo "Installing Sublist3r ---> More setup will be required"
cd tools || return 
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r* || return 
sudo pip3 install -r requirements.txt
cd "$HOME" || return 
sudo printf "%s\n" "alias sublister="python3 "$HOME"/tools/Sublist3r/sublist3r.py"" >> ~/.bashrc
echo " SET YOUR OWN API KEYS IN THE CONFIG FILE"

echo "Installing XSStrike"
cd tools || return 
git clone https://github.com/s0md3v/XSStrike
cd XSStrike || return 
sudo pip3 install requirements.txt
cd "$HOME" || return
sudo printf "%s\n" "alias xsstrike="python3 "$HOME"/tools/XSStrike/xsstrike.py"" >> ~/.bashrc

echo "DONE"
echo $LINE

cd "$HOME" || return 
mkdir WifiHacking

echo " --- Installing Wifi Tools ---"
echo "Installing Aircrack"
mkdir Aircrack-ng
cd Aircrack-ng|| return 
sudo apt-get -y install libssl-dev libnl-3-dev libnl-genl-3-dev ethtool
cd WifiHacking || return 
wget https://download.aircrack-ng.org/aircrack-ng-1.6.tar.gz
tar -zxvf aircrack-ng-1.6.tar.gz
cd aircrack-ng-1.6
sudo make
sudo make install
sudo airodump-ng-oui-update
cd "$HOME" || return 

echo "Installing Wifite"
cd WifiHacking|| return 
git clone https://github.com/derv82/wifite2.git
cd wifite2 || return
sudo python3 setup.py install
cd "$HOME" || return 




echo "DONE"
echo $LINE

echo "--- Installing go ---"

mkdir golang 
cd "$HOME"/golang || return 
git clone https://github.com/udhos/update-golang
cd "$HOME"/golang/update-golang || return
sudo bash update-golang 
sudo cp /usr/local/go/bin/go /usr/bin/ 
cd "$HOME" || return 
echo "DONE"
echo $LINE

echo "--- Installing go tools ---"

echo "installing gobuster"
go get -u -v github.com/OJ/gobuster
sudo cp go/bin/gobuster /usr/bin

echo " installing amass"
GO111MODULE=on go get -v github.com/OWASP/Amass/v3/...
sudo cp go/bin/amass /usr/bin

echo "installing waybackurls"
go get github.com/tomnomnom/waybackurls
sudo cp go/bin/waybackurls /usr/bin

cd "$HOME" || return 


echo "DONE"
echo $LINE

cd "$HOME" || return 
mkdir Radio

echo " --- Installing Radio Tools---"
echo "Installing Inspectrum"
cd Inspectrum|| return 
sudo apt-get install qt5-default libfftw3-dev cmake pkg-config libliquid-dev
git clone https://github.com/miek/inspectrum.git
cd inspectrum || return
mkdir build
cd build
cmake ..
make
sudo make install
cd "$HOME" || return

echo "Installing RTLSDR Scanner"
cd Radio|| return 
sudo apt-get install python python-wxgtk3.0 rtl-sdr
sudo pip install -U rtlsdr_scanner
cd "$HOME" || return


echo "DONE"
echo $LINE
echo "--- Installing tools ---"

echo "Installing nmap"
sudo apt-get install -y nmap

echo "DONE"
echo $LINE 

echo "Installing IP LookUp"
git clone https://github.com/rajkumardusad/IP-Tracer.git
cd IP-Tracer
chmod +x install
./install

echo "DONE"
echo $LINE 

echo "--- Installing wordlists ---"

mkdir /usr/share/wordlists
git clone --depth 1 https://github.com/danielmiessler/SecLists.git
sudo cp SecLists /usr/share/wordlists

echo "--- One last step: Reloading bashrc ---"
source ~/.bashrc

echo "ALL DONE"