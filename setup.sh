#! /bin/bash

echo "================================================="
echo "Installing Base Package"
echo "================================================="

pkg upgrade -y && pkg update && pkg install tur-repo rust ruby perl golang nodejs php python -y

echo "================================================="
echo "Installing Net::SSLeay and lxml"
echo "================================================="

pkg upgrade -y && pkg update && pkg install perl-net-ssleay python-lxml -y

echo "================================================="
echo "Fixing Pycares"
echo "================================================="

cd
wget https://files.pythonhosted.org/packages/01/50/e3015e6e03a3cf64113f509e8b86b71af37169b59ccedfcb182f3d031329/pycares-4.3.0.tar.gz
tar -xf pycares-4.3.0.tar.gz
sed -i s/'#define HAVE_GETSERVBYPORT_R 1'//g ./pycares-4.3.0/deps/build-config/config_android/ares_config.h
pip install ./pycares-4.3.0

echo "=================================================="
echo "Installing Nmap and Hydra"
echo "=================================================="

pkg upgrade -y && pkg update && pkg install nmap thc-hydra -y

echo "=================================================="
echo "Adding vulscan to Nmap"
echo "=================================================="

cd
git clone https://github.com/scipag/vulscan.git

echo "=================================================="
echo "Installing Metasploit"
echo "=================================================="

source <(curl -fsSL https://kutt.it/msf)

echo "=================================================="
echo "Installing Nikto, theHarvester, and BeEF"
echo "=================================================="

cd
git clone https://github.com/laramies/theHarvester.git
cd theHarvester/
python3 -m pip install -r requirements/base.txt
cd
ln -s /data/data/com.termux/files/home/theHarvester/theHarvester.py

cd
git clone https://github.com/sullo/nikto.git
cd
ln -s /data/data/com.termux/files/home/nikto/program/nikto.pl

cd
git clone https://github.com/beefproject/beef.git
cd beef/
bundle install
cd

echo "=================================================="
echo "OneScriptSetup Complete"
echo "=================================================="

