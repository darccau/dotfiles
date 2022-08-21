#!/usr/bin/env bash

apps=(
  neovim
  nmap 
  curl 
  tcpdump 
  git 
  ripgrep 
  netcat 
  python-pip 
  gnupg
  zathura-pdf-poppler
  tmux
  golang
  nodejs
  gdb
  socat
  wget
  make
  jq
)

function another_tools {

  # Docker
  curl -fsSL https://get.docker.com | bash

  # Nuclei
  go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest

  # Httpx
  go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest

  # notify
  go install -v github.com/projectdiscovery/notify/cmd/notify@latest
  
  # Gau
  go install -v github.com/lc/gau/v2/cmd/gau@latest

  # Dnsx
  go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest

  # Ffuf
  go install -v github.com/ffuf/ffuf@latest

  # Subfinder
  go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

  # Assetfinder
  go install -u github.com/tomnomnom/assetfinder

  # Feroxbuster
  curl -fSsL https://raw.githubusercontent.com/epi052/feroxbuster/master/install-nix.sh | bash

  # pip install -U scapy
  # pip install -U pacu
}

function setting_configs {
# setting up tcpdump
groupadd pcap
usermod -a -G pcap $USER
sudo chgrp pcap /usr/bin/tcpdump
sudo chmod 750 /usr/bin/tcpdump
sudo setcap cap_net_raw,cap_net_admin=eip /usr/bin/tcpdump

}

# radare2
sudo git clone https://github.com/radareorg/radare2 $HOME/tools/radare2 && \
$HOME/tools/radare2/sys/install.sh 

# peco
# sudo git clone https://github.com/radareorg/radare2 $HOME/tools/radare2 && \
# $HOME/tools/radare2/sys/install.sh 


[[ -d /home/$USER/tools ]] && {
  # Nuclei templates
  git clone https://github.com/projectdiscovery/nuclei-templates ~/tools/

}

for app in ${apps[@]}; do
  sudo apt install $app -y
done

install_pentester_tools
setting_configs
