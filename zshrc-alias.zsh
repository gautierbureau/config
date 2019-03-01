# /etc/zprofile
# /etc/zshrc

##Aliases
alias la='ls -A'
alias ll='ls -l'
alias lla='ls -alrt'
alias llh='ls -lrhS'
#alias lla='ls ./**/*'

alias rm='rm -i'
alias mv='mv -i'

# Alias
alias v="vim"

# Find cpp
alias find_cpp='find . -name "*.cpp"'

alias source_zsh='source ~/Config/zshrc-oh-my-zsh.zsh'
alias edit_zhsrc='atom ~/Config/zshrc-oh-my-zsh.zsh'

alias help_vim='less ~/Help/help_vim.txt'
alias help_ed='less ~/Help/help_ed.txt'
alias help_emacs='less ~/Help/help_emacs.txt'
alias help_nano='less ~/Help/help_nano.txt'
alias help_regex='less ~/Help/help_regex.txt'
alias help_rte='less ~/Help/help_rte_voc.txt'
alias help_python='less ~/Help/help_python.txt'

alias edit_help_vim='vim ~/Help/help_vim.txt'
alias edit_acro="vim ~/Help/help_acronyms.txt"
alias edit_rte="vim ~/Help/help_rte_voc.txt"

# Needs a pid id after command
alias my_top='top -stats pid,command,cpu,mem,time,user'
alias my_top_id='top -stats pid,command,cpu,mem,time,user -pid '

# https://misc.flogisoft.com/bash/tip_colors_and_formatting
alias stripcolors='sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g"'

alias who_use_internet="lsof -P -i -n | cut -f 1 -d\" \" | uniq"

alias gdb='gdb -q'

#alias objdump='objdump -x86-asm-syntax intel'

alias start_docker="sudo systemctl start docker"
alias restart_docker="sudo systemctl restart docker"
alias env_docker="systemctl show --property=Environment docker"
alias status_docker="systemctl status docker" # ou service status docker

alias docker_create_fedora="docker run --privileged=true --name \"myfedora\" -i -v /:/myfedora -t fedora /bin/bash"
alias start_docker_fedora="docker start myfedora"
alias stop_docker_fedora="docker stop myfedora"
alias docker_fedora="docker exec -it -u root myfedora /bin/bash"

alias docker_create_ubuntu="docker run --privileged=true --name \"myubuntu\" -i -v /:/myfedora -t gautierbureau/ubuntu /bin/bash"
alias start_docker_ubuntu="docker start myubuntu"
alias stop_docker_ubuntu="docker stop myubuntu"
alias docker_ubuntu="docker exec -it -u root myubuntu /bin/bash"

alias start_docker_morefem="docker start morefem"
alias stop_docker_morefem="docker stop morefem"
alias docker_morefem="docker exec -it morefem /bin/bash"

alias docker_centos="docker exec -it mycentos /bin/bash"

alias mate="atom"

alias before_commit="git difftool --staged HEAD -- . ':!*.tar.gz'"
alias last_commit="git lastcommit"

alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"

alias open="xdg-open"

# To install spark hadoop luarocks

alias latexit="klatexformula &"

alias myip="ip -br -c a"
alias find_ip="ip -br -c a"

alias install="sudo dnf install"

alias vim="vimx"

alias cd1="cd .."
alias cd2="cd ../.."
alias cd3="cd ../../.."
alias cd4="cd ../../../.."
alias cd5="cd ../../../../.."

alias save_dnf_packages="sudo dnf list installed > $HOME/Config/dnf_installed.txt"

alias pandoc="$HOME/.local/bin/pandoc"

alias viewmd="grip -b"

unalias run-help
autoload -Uz run-help
autoload -Uz run-help-git
autoload -Uz run-help-svn
autoload -Uz run-help-svk
alias help=run-help

alias edit_fedora_cheat_sheet="texmaker $HOME/Documents/CheatSheet/Latex/Fedora_shortcuts.tex&"
alias view_fedora_cheat_sheet="xdg-open $HOME/Documents/CheatSheet/Latex/Fedora_shortcuts.pdf&"

alias list_files_inside_package="rpm -ql"

alias writer2latex="java -jar /usr/share/java/writer2latex.jar"

if [ -f "$CONFIG_PATH/zshrc-alias-rte.zsh" ]; then
  . $CONFIG_PATH/zshrc-alias-rte.zsh
fi
