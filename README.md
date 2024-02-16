# Termux-Offsec

This repo contains some guide to install some useful tool for pentester on termux, tested on my android 14 aarch64 device non-rooted.

## OneScriptSetup
I made a script to easily install all tools, but make sure you have more than 7GB free space.
```
bash
git clone https://github.com/wakhidrf/Termux-Offsec.git
cd Termux-Offsec
bash setup.sh
```

## Nmap
Run this
```
pkg update && pkg install nmap -y
```
**Optional** Adding vulscan.nse script
```
cd
git clone https://github.com/scipag/vulscan.git
cd ../usr/share/nmap/scripts/
ln -s /data/data/com.termux/files/home/vulscan/
```

## THC-Hydra
You need termux user repository repo to install hydra, do
```
pkg update && pkg install tur-repo -y
```
Then run this
```
pkg update && pkg install thc-hydra -y
```

## Metasploit
[guzhmazuko](https://github.com/gushmazuko/metasploit_in_termux) made an easy installation of metasplot on termux, do
```
bash
source <(curl -fsSL https://kutt.it/msf)
```

## theHarvester
You need python to install theHarvester, do
```
pkg update && pkg install python -y
```
Then clone this repo
```
git clone https://github.com/laramies/theHarvester.git
```
Fix lxml, do
```
pkg update && pkg install python-lxml -y
```
Fix pycares, do
```
wget https://files.pythonhosted.org/packages/01/50/e3015e6e03a3cf64113f509e8b86b71af37169b59ccedfcb182f3d031329/pycares-4.3.0.tar.gz
tar -xf pycares-4.3.0.tar.gz
sed -i s/'#define HAVE_GETSERVBYPORT_R 1'//g ./pycares-4.3.0/deps/build-config/config_android/ares_config.h
pip install ./pycares-4.3.0
```
Inside theHarvester folder, do
```
python3 -m pip install -r requirements/base.txt
```
Make shortcut on home directory, do
```
cd
ln -s /data/data/com.termux/files/home/theHarvester/theHarvester.py
```
To run theHarvester, do
```
python3 theharvester.py -h
```
To set API, follow [laramies](https://github.com/laramies/theHarvester/wiki/Installation#api-keys) guide

## Nikto
You need perl to install nikto, do
```
pkg update && pkg install perl -y
```
Then clone this repo
```
git clone https://github.com/sullo/nikto.git
```
Make shortcut on home directory, do
```
cd
ln -s /data/data/com.termux/files/home/nikto/program/nikto.pl
```
To run nikto, do
```
perl nikto.pl -h
```
**Optional** adding ssl support
```
cd
git clone https://github.com/wakhidrf/Termux-Offsec.git
cd Termux-Offsec/assets/
cp nikto.conf.default ../../nikto/program/nikto.conf.default
```

## BeEF
You need rubygem to install BeEF, do
```
pkg update && pkg install ruby -y
```
Then clone this repo
```
git clone https://github.com/beefproject/beef.git
```
Inside beef folder, do
```
bundle install
```
To run BeEF, do
```
bash ./beef
```

## Ngrok
To install ngrok, you need to sign up at [ngrok]( https://ngrok.com/), then run this
```
cd
git clone https://github.com/wakhidrf/Termux-Offsec.git
cd Termux-Offsec/assets/
tar -xvzf ngrok-v3-stable-linux-arm64.tgz -C /data/data/com.termux/files/usr/bin
```
Then use your token
```
ngrok config add-authtoken <Your Token>
```

## Nuclei
You need golang to install nuclei, do
```
pkg update && pkg install golang -y
```
Then run this
```
cd
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
cd ../usr/bin/
ln -s /data/data/com.termux/files/home/go/bin/nuclei
```

## Mosint
You need golang to install mosint, do
```
pkg update && pkg install golang -y
```
Then run this
```
cd
go install -v github.com/alpkeskin/mosint/v3/cmd/mosint@latest
git clone https://github.com/wakhidrf/Termux-Offsec.git
cd ../usr/bin/
ln -s /data/data/com.termux/files/home/ho/bin/mosint
cd
cd Termux-Offsec/assets/
cp .mosint.yaml /data/data/com.termux/files/home/.mosint.yaml
```
To set API, follow [alpkeskin](https://github.com/alpkeskin/mosint) guide

## Anubis-Netsec
You need python to install anubis-netsec, do
```
pkg update && pkg install python -y
```
Then run this
```
cd
pip install anubis-netsec
git clone https://github.com/wakhidrf/Termux-Offsec.git
cd ../usr/lib/python3.11/site-packages/dns/
rm -rf resolver.py
cp /data/data/com.termux/files/home/Termux-Offsec/assets/resolver.py resolver.py
```

## RetireJS
You need npm to install RetireJS, do
```
pkg update && pkg install nodejs -y
```
Then run this
```
cd
npm install -g retire
retire
```
