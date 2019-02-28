# /etc/zprofile
# /etc/zshrc

# or Use pgrep
# -A enables other programs not controlled by the terminal
# ps axw
process_id() {
	ps -A | grep $1 #| cut -d' '  -f$2,$3
}

find_command() {
	egrep $1 ~/Codes/Scripts/all_bash_commands.txt
}
# find all commands : ie tout afficher : find_command " "
# "[R-r]un" search run and Run

# I put two spaces because each command starts this way, if not I get all words starting with the letter I give in argument
# \< : start of the word
# \b : boundary
find_command_starts_with() {
	find_command "  \b$1\w*"
	#find_command "  \<$1\w*"
}

find_acro() {
	egrep $1 ~/Help/help_acronyms.txt
}

find_rte() {
	egrep $1 ~/Help/help_rte_voc.txt
}
# find all commands : ie tout afficher : find_command " "
# "[R-r]un" search run and Run

# I put two spaces because each command starts this way, if not I get all words starting with the letter I give in argument
# \< : start of the word
# \b : boundary
find_acro_starts_with() {
	find_acro "  \b$1\w*"
	#find_command "  \<$1\w*"
}

find_rte_starts_with() {
	find_rte "  \b$1\w*"
	#find_command "  \<$1\w*"
}

# https://misc.flogisoft.com/bash/tip_colors_and_formatting

bold()          { ansi 1 "$@"; }
italic()        { ansi 3 "$@"; }
underline()     { ansi 4 "$@"; }
strikethrough() { ansi 9 "$@"; }
red()           { ansi 31 "$@"; }
green()         { ansi 32 "$@"; }
ansi()          { echo -e "\e[${1}m${*:2}\e[0m"; }

# Black: 30
# Blue: 34
# Cyan: 36
# Green: 32
# Purple: 35
# Red: 31
# White: 37
# Yellow: 33


# exemple to use with
# echo "some $(italic hello world) text"
# \e[0m” sequence removes all attributes

ed() {
	echo -e "${UNDERLINE}${BOLD}Help ed:$OFF$OFF"
	echo "${BOLD}q$OFF ${ITALIC}quit$OFF, ${BOLD}a$OFF ${ITALIC}add lines$OFF, ${BOLD}.$OFF + ${BOLD}return$OFF ${ITALIC}end buffer$OFF, ${BOLD}w$OFF ${ITALIC}save$OFF, ${BOLD}H$OFF ${ITALIC}print errors$OFF";
	echo "${BOLD}6d$OFF ${ITALIC}delete line 6$OFF, ${BOLD}u$OFF ${ITALIC}undo$OFF, ${BOLD}c$OFF ${ITALIC}replace current line$OFF, ${BOLD}p$OFF ${ITALIC}print$OFF";
	echo -e "${BOLD}2$OFF ${ITALIC}print line 2$OFF, ${BOLD}i$OFF ${ITALIC}add line before current line$OFF\n";
	command ed -p\$ "$@" ;
}

compile() {
	clang++ -o $1 $1.cpp
}

compile_main() {
	# clang++ -o main.o -c -std=c++14  main.cpp
	# clang++ main.o -o main
	clang++ -o main main.cpp
}

# jhome () {
#   export JAVA_HOME=`/usr/libexec/java_home $@`
#   echo "JAVA_HOME:" $JAVA_HOME
#   echo "java -version:"
#   java -version
# }
# To switch : jhome -v 1.6

source_python3() {
	export PATH=$HOME/Software/anaconda3/bin:$PATH
}

source_python2() {
	export PATH=$HOME/Software/anaconda2/bin:$PATH
}

path_remove() {
  # Delete path by parts so we can never accidentally remove sub paths
  PATH=${PATH//":$1:"/":"} # delete any instances in the middle
  PATH=${PATH/#"$1:"/} # delete any instance at the beginning
  PATH=${PATH/%":$1"/} # delete any instance in the at the end
}

remove_anaconda_python() {
	path_remove "$HOME/Software/anaconda2/bin"
	path_remove "$HOME/Software/anaconda3/bin"
}

add_anaconda_python() {
	if [[ -z "$1" ]]; then
		echo "Need an argument for version."
		return 1
	fi
	export PATH=$HOME/Software/anaconda$1/bin:$PATH
}

see_options() {
	set -o | grep -w on
}

format_xml() {
	if [[ -z "$1" ]]; then
		echo "Need a string argument."
		return 1
	fi
	echo $1 | xmllint --format -
}

format_html() {
	if [[ -z "$1" ]]; then
		echo "Need a string argument."
		return 1
	fi
	# xmllint --format --html $1
	# https://github.com/ericchiang/pup
	cat $1 | pup
	# xmlstarlet fo --html $1
	#tidy -i $1
}

add_ld_lib() {
	if [[ -z "$1" ]]; then
		echo "Need a path for library to add."
		return 1
	fi
	export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:$1
}

test_cxx_std_flag() {
	if [[ -z "$1" ]]; then
		echo "Need a c++ version."
		return 1
	fi
  echo "int main() {return 0;}" > test_cxx$1.cpp
  g++ -std=c++$1 -c test_cxx$1.cpp -o test_cxx$1 2> /dev/null
  RETURN_CODE=$?
  if [ $RETURN_CODE -eq 0 ]; then
    echo "-std=c++$1 is enabled."
  else
    g++ -std=c++0x -c test_cxx$1.cpp -o test_cxx$1 2> /dev/null
    RETURN_CODE=$?
    if [ $RETURN_CODE -eq 0 ]; then
			echo "-std=c++0x is enabled."
    else
			echo "-std=c++98 is enabled."
    fi
	fi
	rm -f test_cxx$1*
	c++ -dM -E -x c++ /dev/null | grep -F __cplusplus | cut -d ' ' -f 3 | cut -c 1-4
}

# From https://www.linuxnix.com/convert-binaryhex-oct-decimal-linuxunix/
decimal_to_binary() {
	if [[ -z "$1" ]]; then
		echo "Need a decimal argument."
		return 1
	fi
	echo "obase=2;ibase=10; $1" | bc
}

hex_to_binary() {
	if [[ -z "$1" ]]; then
		echo "Need an hex argument."
		return 1
	fi
	echo "obase=2;ibase=16; $1" | bc
}

hex_to_decimal() {
	if [[ -z "$1" ]]; then
		echo "Need an hex argument."
		return 1
	fi
	echo "obase=10;ibase=16; $1" | bc
}

binary_to_hex() {
	if [[ -z "$1" ]]; then
		echo "Need a binary argument."
		return 1
	fi
	echo "obase=16;ibase=2; $1" | bc
}

binary_to_decimal() {
	if [[ -z "$1" ]]; then
		echo "Need a binary argument."
		return 1
	fi
	echo "obase=10;ibase=2; $1" | bc
}

# From https://stackoverflow.com/questions/10768160/ip-address-converter
decimal_to_ip () {
	if [[ -z "$1" ]]; then
		echo "Need a decimal argument."
		return 1
	fi
  local delim ip dec=$1
  for e in {3..0}
  do
      ((octet = dec / (256 ** e) ))
      ((dec -= octet * 256 ** e))
      ip+=$delim$octet
      delim=.
  done
  printf '%s\n' "$ip"
}

ip_to_decimal () {
	if [[ -z "$1" ]]; then
		echo "Need an IP argument."
		return 1
	fi
  local a b c d ip=$1
  IFS=. read -r a b c d <<< "$ip"
  printf '%d\n' "$((a * 256 ** 3 + b * 256 ** 2 + c * 256 + d))"
}

# https://stackoverflow.com/questions/15429420/given-the-ip-and-netmask-how-can-i-calculate-the-network-address-using-bash
network_adress() {
	if [[ -z "$1" ]]; then
		echo "Need an IP argument."
		return 1
	fi
	if [[ -z "$2" ]]; then
		echo "Need a subnet mask argument."
		return 1
	fi
	addr=$(ip_to_decimal $1)
	mask=$(ip_to_decimal $2)
	network=$((addr & mask))
	#echo $network
	decimal_to_ip $network
}

host_id() {
	if [[ -z "$1" ]]; then
		echo "Need an IP argument."
		return 1
	fi
	if [[ -z "$2" ]]; then
		echo "Need a subnet mask argument."
		return 1
	fi
	addr=$(ip_to_decimal $1)
	mask=$(ip_to_decimal $2)
	mask_comp_signed=$((~mask))
	thirty_two_bits=$(hex_to_decimal FFFFFFFF)
	mask_comp_unsigned=$((thirty_two_bits+mask_comp_signed+1))
	hostId=$((addr & mask_comp_unsigned))
	decimal_to_ip $hostId
}

broadcast_adress() {
	if [[ -z "$1" ]]; then
		echo "Need an IP argument."
		return 1
	fi
	if [[ -z "$2" ]]; then
		echo "Need a subnet mask argument."
		return 1
	fi
	addr=$(ip_to_decimal $1)
	mask=$(ip_to_decimal $2)
	mask_comp_signed=$((~mask))
	thirty_two_bits=$(hex_to_decimal FFFFFFFF)
	mask_comp_unsigned=$((thirty_two_bits+mask_comp_signed+1))
	#echo $(decimal_to_binary $mask_comp_unsigned)
	#echo $(decimal_to_binary $mask)
	net_add=$(network_adress $1 $2)
	#echo $net_add
	net_add_dec=$(ip_to_decimal $net_add)
	broadcast=$((net_add_dec | mask_comp_unsigned))
	#echo $broadcast
	decimal_to_ip $broadcast
}

# https://stackoverflow.com/questions/20762575/explanation-of-convertor-of-cidr-to-netmask-in-linux-shell-netmask2cdir-and-cdir
# https://serverfault.com/questions/54981/linux-command-line-tool-to-work-with-netmasks-cidr-notation
netmask_to_cidr() {
	if [[ -z "$1" ]]; then
 	 echo "Need a subnet mask argument."
 	 return 1
  fi
	mask_dec=$(ip_to_decimal $1)
	mask_bin=$(decimal_to_binary $mask_dec)
	cidr=$(echo -n $mask_bin | grep -o -e "1*" | tr -d '\n' | wc -m)
	echo $cidr
}

# https://stackoverflow.com/questions/19075671/how-do-i-use-shell-variables-in-an-awk-script
cidr_to_netmask() {
	if [[ -z "$1" ]]; then
 		echo "Need a cidr argument."
 		return 1
  fi
	mask_bin=$(awk -v N="$1" 'BEGIN {while (c++<N) printf "1";while (p++<(32-N)) printf "0"}')
	mask_dec=$(binary_to_decimal $mask_bin)
	decimal_to_ip $mask_dec
}

are_on_same_network() {
	if [[ -z "$1" ]]; then
 		echo "Need an ip argument."
 		return 1
  fi
	if [[ -z "$2" ]]; then
 		echo "Need a subnet mask argument."
 		return 1
  fi
	if [[ -z "$3" ]]; then
 		echo "Need an ip argument."
 		return 1
  fi
	if [[ -z "$4" ]]; then
		echo "Need a subnet mask argument."
		return 1
	fi
	net_addr1=$(network_adress $1 $2)
	net_addr2=$(network_adress $3 $4)
	net_addr1_dec=$(ip_to_decimal $net_addr1)
	net_addr2_dec=$(ip_to_decimal $net_addr2)
	res=$((net_addr1_dec ^ net_addr2_dec))
	echo $(decimal_to_binary $res)
}

number_of_ip_subnet() {
	if [[ -z "$1" ]]; then
 		echo "Need a cidr argument."
 		return 1
  fi
	printf '%d\n' "$((2**(32-$1)-2))"
}

range_of_adresses() {
	if [[ -z "$1" ]]; then
		echo "Need an IP argument."
		return 1
	fi
	if [[ -z "$2" ]]; then
		echo "Need a subnet mask argument."
		return 1
	fi
	net_add=$(network_adress $1 $2)
	net_add_dec=$(ip_to_decimal $net_add)
	num_ip=$(number_of_ip_subnet $(netmask_to_cidr $2))
	last_add=$((net_add_dec+num_ip))
	decimal_to_ip $((net_add_dec+1))
	decimal_to_ip $last_add
}

pdfviewer() {
	if [[ -z "$1" ]]; then
		echo "Need a pdf argument."
		return 1
	fi
	nohup evince $1 &
}

history_n() {
	if [[ -z "$1" ]]; then
		echo "Need a number argument."
		return 1
	fi
	fc -l -$1
}

change_encoding() {
	if [[ -z "$1" ]]; then
		echo "Need a target encoding argument."
		return 1
	fi
	if [[ -z "$2" ]]; then
		echo "Need a file argument."
		return 1
	fi
	if [[ ! -z "$3" ]]; then
  	iconv -f $3 -t $1 $2 > $2.tmp
	else
		iconv -t $1 $2 > $2.tmp
	fi
  rm -f $2
  mv $2.tmp $2
}

reload_zsh_completion() {
  rm -f ~/.zcompdump*
  compinit
}

launch_python_server() {
  python -m SimpleHTTPServer 8080 &> /dev/null &
  #python3 -m http.server 8080 &> /dev/null &
}

cmake_modules() {
  echo /usr/share/cmake/Modules
}

gcc_help() {
  g++ -v --help
}

package_content() {
  # rpm -qpl $1
  dzdo dnf repoquery -l $1
}

DEBUG() {
 [ "$_DEBUG" == "on" ] && $@
}

find_all_extensions() {
  for file in $(find . -name "*"); do echo "$file" | awk -F. '{print $NF}'; done | sort | uniq
}

if [ -f "$CONFIG_PATH/zshrc-functions-rte.zsh" ]; then
  . $CONFIG_PATH/zshrc-functions-rte.zsh
fi
