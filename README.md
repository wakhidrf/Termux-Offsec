# Termux-Offsec

This repo contains some guide to install some useful tool for pentester on termux, tested on my android 14 aarch64 device non-rooted.

## OneScriptSetup
I made a script to easily install all tools, but make sure you have more than 4GB free space.
```
bash
git clone https://github.com/wakhidrf/Termux-Offsec.git
cd Termux-Offsec
bash setup.sh
```

## Nmap
To install nmap just easily do
```
pkg update && pkg install nmap -y
```

## THC-Hydra
To install thc-hydra need to add termux user repository repo, do
```
pkg update && pkg install tur-repo -y
```
Then install thc-hydra, do
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
To install theHarvester, clone this repo
```
git clone https://github.com/laramies/theHarvester.git
```
Install lxml, do
```
pkg update && pkg install python-lxml -y
```
Install pycares, do
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
Back to home directory to make shortcut, do
```
ln -s /data/data/com.termux/files/home/theHarvester/theHarvester.py
```
Run theHarvester, do
```
python3 theharvester.py -h
```
To set API, follow [laramies](https://github.com/laramies/theHarvester/wiki/Installation#api-keys) guide

## Nikto
Instal perl, do
```
pkg update && pkg install perl -y
```
Then clone this repo
```
git clone https://github.com/sullo/nikto.git
```
Make shortcut on home directory, do
```
ln -s /data/data/com.termux/files/home/nikto/program/nikto.pl
```
Run nikto, do
```
perl nikto.pl -h
```

## BeEF
Install rubygem, do
```
pkg update && pkg install ruby -y
```
Clone this repo
```
git clone https://github.com/beefproject/beef.git
```
Inside beef folder, do
```
bundle install
```
Run BeEF, do
```
bash ./beef
```

## Ngrok
You need to sign up first at [ngrok]( https://ngrok.com/), then
```
git clone https://github.com/wakhidrf/Termux-Offsec.git
cd Termux-Offsec/assets/
tar -xvzf ngrok-v3-stable-linux-arm64.tgz -C /data/data/com.termux/files/usr/bin
```
Then use your token
```
ngrok config add-authtoken <Your Token>
```
