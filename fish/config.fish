
if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting
set -gx SHELL /usr/bin/fish
set -gx EDITOR nvim
set -gx VIEWER zathura
set -gx GOPATH $HOME/.go
set -gx WORDLIST ~/tools/wordlist/
set -gx PATH bin $PATH
set -gx PATH ~/.cargo/bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH /opt/local/bin /opt/local/sbin $PATH

alias vi="nvim "
alias g="git "
alias ls='exa -lbF --git'                                              # list, size, type, git
alias ll='exa -lbGF --git'                                             # long list
alias llm='exa -lbGd --git --sort=modified'                            # long list, modified date sort
alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'  # all list
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' 

function fish_prompt -d "Write out the prompt" 
printf '$ ' 
end

##preexec functions
#function my_preexec --on-event fish_preexec
# if set -q SCREENSHOT
#  if not string match --quiet -r '^rm|^ls|^cat|^cd' $argv[1] 
#   if set -q PROJECT
#    set path_log $PROJECT/logs
#   else
#    set path_log $HOME
#   end
#   tmux pipe-pane -o "cat >> $path_log/tmux_log.#S:#I-#P_tmp.log"
#   echo ">" $argv[1]
#
#  end
# end
#end

# #postexec functions
# function my_postexec --on-event fish_postexec
#  if set -q SCREENSHOT
#   if not string match --quiet -r '^rm|^ls|^cat|^cd |^set' $argv[1]
#    if set -q PROJECT
#     set path_log $PROJECT/logs
#     set path_pic $PROJECT/screenshots/
#    else
#     set path_log $HOME
#     set path_pic $HOME/Pictures/
#    end
#    tmux pipe-pane \;
#    set command (echo $argv[1] | sed -E "s/[[:punct:]]|[[:space:]]/_/g")
#    set dest $path_log/tmux_log_(date +%Y%m%d-%H%M%S)_(echo $command).log
#    tmux pipe-pane -o "mv -f $path_log/tmux_log.#S:#I-#P_tmp.log $dest"
#    flameshot screen -p $path_pic
#   end
#  end
# end

function wl 
  find $HOME/tools/SecLists/ -type f | fzf --with-nth='-1' -d/ | xclip -selection clipboard
end

function add_to_lists
	echo $1 | anew ~/tools/wls/recursive.txt
	echo $1 | anew ~/tools/wls/massive.txt
	echo $1 | anew ~/tools/wls/quick.txt
end

function nuclei_site
    echo $1 | nuclei -t cves/ -t exposed-tokens/ -t exposed-tokens/ \
		-t exposed-tokens/ -t vulnerabilities/ -t fuzzing/ -t misconfiguration/ \
		-t miscellaneous/dir-listing.yaml -c 30
		# -t miscellaneous/dir-listing.yaml -pbar -c 30
end

function nuclei_file 
    nuclei -l $1 -t cves/ -t exposed-tokens/ -t exposed-tokens/ \
		-t exposed-tokens/ -t vulnerabilities/ -t fuzzing/ -t misconfiguration/ \
		-t miscellaneous/dir-listing.yaml -pbar -c 50
end

# function ffuf_quick
#    set dom (echo $argv[1] | unfurl format %s%d)
#    set wordlist argv[2]
#    [[ -d $wordlist ]] && wordlist=quick.txt
# 
#    ffuf -c -v -u $argv[1]/FUZZ -w $wordlist \
#    -H "User-Agent: Mozilla Firefox Mozilla/5.0" \
#    -H "X-Bug-Bounty: darccau" -ac -mc all -o quick_$dom.csv \
#    -of csv $argv[2] -maxtime 360 $argv[3]
# end
# 
# function ffuf_recursive
#     mkdir -p recursive
#     set dom (echo $argv[1] | unfurl format %s%d)
#     ffuf -c -v -u $argv[1]/FUZZ -w $argv[2] -H "User-Agent: Mozilla Firefox Mozilla/5.0" \
#     -H "X-Bug-Bounty: darccau" -recursion -recursion-depth 5 -mc all -ac \
#     -o recursive/recursive_$dom.csv -of csv $argv[3]
# end
# 
# function ffuf_vhost
#     set dom (echo $argv[1] | unfurl format %s%d)
#     ffuf -c -u $argv[1] -H "Host: FUZZ" -w vhosts.txt \
#     -H "X-Bug-Bounty: darccau" -ac -mc all -fc 400,404 -o vhost_$dom.csv
# end

