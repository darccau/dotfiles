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
  tmux
  golang
  nodejs
  gdb
  socat
  wget
  make
  ssh
  jq
  ufw
)

  # Docker
  curl -fsSL https://get.docker.com | bash

function recon_tools {
  # nuclei
  go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest

  # katana
  go install github.com/projectdiscovery/katana/cmd/katana@latest

  # httpx
  go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest

  # notify
  go install -v github.com/projectdiscovery/notify/cmd/notify@latest
  
  # gau
  go install -v github.com/lc/gau/v2/cmd/gau@latest

  # asnmap
  go install github.com/projectdiscovery/asnmap/cmd/asnmap@latest

  # dnsx
  go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest

  # ffuf
  go install -v github.com/ffuf/ffuf@latest

  # subfinder
  go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

  # assetfinder
  go install -u github.com/tomnomnom/assetfinder

}

python3 -m pip install --upgrade scapy
python3 -m pip install --upgrade pacu
python3 -m pip install --upgrade pwntools

function enable_tcpdump_work_as_user {
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
# $HOME/tools/radare2/sys/install.sh # # $HOME/tools/radare2/sys/install.sh 
#

[[ -d /home/$USER/tools ]] && {
  # Nuclei templates
  git clone https://github.com/projectdiscovery/nuclei-templates ~/tools/

}

for app in ${apps[@]}; do
  sudo dnf install $app -y
done

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#install_pentester_tools
#setting_configs
