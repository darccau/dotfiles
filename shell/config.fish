# Theme
set -g fish_greeting
set -g theme_hide_hostname no
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hostname always

# Aliases
alias g='git'
alias vi='nvim'
alias j='z'
alias tree='exa --tree'
alias ls='exa -lbF --git'
alias llm='exa -lbGd --git --sort=modified'
alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale'

# Environment variables
set -gx EDITOR nvim

fish_add_path /usr/local/.go/bin
fish_add_path /usr/local/go/bin
fish_add_path /home/darccau/.go/bin
fish_add_path /home/darccau/.local/bin

fish_add_path /usr/local/go/bin
fish_add_path /home/darccau/.cargo/bin



function create_container
    set -l container_name $argv[1]
    touch $ENCRYPT_FOLDER/container/$container_name
    dd if=/dev/urandom of="$ENCRYPT_FOLDER/container/$container_name" bs=1M count=4096 iflag=fullblock
    sudo cryptsetup luksFormat $ENCRYPT_FOLDER/container/$container_name
    sudo cryptsetup luksOpen $ENCRYPT_FOLDER/container/$container_name $container_name
    sudo mkfs.ext4 /dev/mapper/$container_name
    sudo cryptsetup luksClose $container_name
    mkdir -p $ENCRYPT_FOLDER/$container_name
end


function mount_encrypt
    sudo cryptsetup luksOpen $ENCRYPT_FOLDER/container/$1 $1
    sudo mount -t ext4 /dev/mapper/$1 $ENCRYPT_FOLDER/$1
    sudo chown $USER $ENCRYPT_FOLDER/$1
end

function unmount_encrypt
    sudo unmount $ENCRYPT_FOLDER/$1
    sudo cryptsetup luksClose $1
end

