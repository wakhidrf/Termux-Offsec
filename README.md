# Termux-Offsec

This repo contains some guide to install some useful tool for pentester on termux, tested on my android 14 aarch64 device non-rooted.

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
mkdir builds
cd builds/
git clone https://github.com/saghul/pycares
cd pycares/
nano deps/c-ares/src/config_linux/ares_config.h
```
Inside theHarvester folder, do
```
python3 -m pip install -r requirements/base.txt
```
back to home directory, do
```
ln -s /data/data/com.termux/files/home/theHarvester/theharvester,py
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