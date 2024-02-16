#! /bin/bash

echo "================================================="
echo "Installing Base Package"
echo "================================================="

pkg upgrade -y && pkg update && pkg install tur-repo wget rust ruby perl golang nodejs php python -y

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
cd ../usr/share/nmap/scripts/
ln -s /data/data/com.termux/files/home/vulscan/

echo "=================================================="
echo "Installing Metasploit"
echo "=================================================="

cd
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
cd Termux-Offsec/assets/
cp nikto.conf.default ../../nikto/program/nikto.conf.default

cd
git clone https://github.com/beefproject/beef.git
cd beef/
bundle install

echo "================================================="
echo "Installing Ngrok"
echo "================================================="

cd
cd Termux-Offsec/assets/
tar -xvzf ngrok-v3-stable-linux-arm64.tgz -C /data/data/com.termux/files/usr/bin

echo "================================================="
echo "Installing Nuclei and Mosint"
echo "================================================="

cd
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
go install -v github.com/alpkeskin/mosint/v3/cmd/mosint@latest
cd ../usr/bin/
ln -s /data/data/com.termux/files/home/go/bin/nuclei
ln -s /data/data/com.termux/files/home/ho/bin/mosint
cd
cd Termux-Offsec/assets/
cp .mosint.yaml /data/data/com.termux/files/home/.mosint.yaml

echo "=================================================="
echo "Installing Anubis-Netsec"
echo "=================================================="

cd
pip install anubis-netsec
cd ../usr/lib/python3.11/site-packages/dns/
rm -rf resolver.py
cp /data/data/com.termux/files/home/Termux-Offsec/assets/resolver.py resolver.py

echo "=================================================="
echo "Installing RetireJS"
echo "=================================================="

cd
npm install -g retire
retire

echo "=================================================="
echo "OneScriptSetup Complete"
echo "=================================================="
