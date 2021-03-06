# /etc/zprofile
# /etc/zshrc

# ----------------------------------------------------------------------------
#   Zshrc
#   Author 	: Grubly
#   Patched by 	: Milipili, f00ty
# ----------------------------------------------------------------------------

# --------------------------------------------------------------- Settings ---
USER=`whoami`
OS=`uname -s`
MYEDITOR="vim"

export HOME=/home/$USER
cd $HOME
export LC_ALL='en_US.UTF-8'


# ------------------------------------------------------ ZSH Configuration ---

if [ -f /etc/profile ]; then
	source /etc/profile 2>/dev/null >/dev/null
fi

## Am I a special user ??
if (( EUID == 0 )); then
	superUser="yes";
else
	groups | egrep "wheel|adm|staff|sys|es" > /dev/null
	if [ "$?" -eq 0 ]; then
		superUser="yes";
	else
		superUser="no";
	fi;
fi;

## Eterm is not recognised by most OSes
if [[ $TERM = "Eterm" ]] ; then
	case $OS in
      	Linux)
			export TERM=Eterm
			;;
		NetBSD)
			export TERM=xterm
			;;
		*)
			export TERM=xterm-color
        	;;
	esac
fi

## xterm is not recognized by NetBSD (1.6)
if  [[ $TERM = "xterm-color" ]] ; then
	case $OS in
		NetBSD)
			export TERM=xterm
			;;
	esac
fi

# Default umask
umask 022

if [ "$OS" = 'FreeBSD' ]; then
	export EDITOR="/usr/local/bin/$MYEDITOR"
else
	export EDITOR="/usr/bin/$MYEDITOR"
fi

addExportPath()
{
	if [ -d "$1" ] ; then
		if [ ! "$2" = "" -a -d "$2" ]; then
			export PATH="$2:$PATH"
		fi
		export PATH="$1:$PATH"
	fi
}

#addExportPath '/sw/bin'  '/sw/sbin'
addExportPath '/usr/bin'  '/usr/sbin'
addExportPath '/bin'  '/sbin'
addExportPath '/usr/local/bin'  '/usr/local/sbin'
addExportPath '/opt/local/bin'  '/opt/local/sbin'

# Misc options
setopt correct
setopt correct_all
setopt auto_cd
setopt hist_ignore_dups
setopt auto_list
setopt append_history
setopt auto_param_keys
setopt auto_param_slash
setopt bg_nice
setopt complete_aliases
setopt equals
setopt extended_glob
setopt hash_cmds
setopt hash_dirs
setopt mail_warning
setopt magic_equal_subst
setopt numericglobsort
setopt pushd_ignore_dups
setopt printeightbit
unsetopt beep

## Command history configuration
if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=10000000
SAVEHIST=10000000

# Show history
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

# Filename suffixes to ignore during completion
fignore=(.o .c~ .pro)

## Prevent CVS/SVN files/directories from being completed
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#CVS'
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)svn'
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#svn'

# ignore patterns you don't have
zstyle ':completion:*:functions' ignored-patterns '_*'

## set colors for GNU ls ; set this to right file
if [ "$SHELL" = '' ]; then # fixing
	export SHELL=`which zsh`
fi
my_ls=ls
#which gls > /dev/null
#if [ $? -eq 0 ]; then
#	my_ls=gls
#fi

which dircolors > /dev/null
if [ $? -eq 0 ]; then
	#eval `dircolors`
	export LS_COLORS="no=00:fi=00:di=00;36:ln=00;32:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.png=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:"
	ls=$my_ls' -F --color=always'
else
	## dircolors not availaible, try gdircolors
	which gdircolors > /dev/null
	if [ $? -eq 0 ]; then
		eval `gdircolors -b | sed 's/;34/;36/g'`
		ls=$my_ls' --color=auto'
		alias df='gdf'
	else
		## GNU ls not available, using other one.
		export LS_COLORS="no=00:fi=00:di=00;36:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.png=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:"
		case $OS in
        	FreeBSD)
				export BLOCKSIZE=K
				export CLICOLOR=enable
  				autoload -U is-at-least
        		export LS_COLORS="gxfxBxcxbxegedabagacad"
				ls='ls -F'
        	;;
        	OpenBSD|NetBSD|Darwin|SunOS)
        		ls='ls -F -G'
        	;;
		esac
	fi
fi
# Doesn't work here!
#export LSCOLORS="$LS_COLORS"

# Good prompts
autoload -U colors
colors

path_color="yellow"
sym_color="cyan"
time_color="white"
err_color="red"
num_color="blue"
computer_color="cyan"
if [ "$USER" = "root" ]; then
	login_color="red"
else
	login_color="green"
fi
cpath="%B%{$fg[$path_color]%}%30<...<%~%b"
psym="%{$fg[$sym_color]%}%%"
plogin="%{$fg[$login_color]%}[$USER]"
time="%{$fg[$time_color]%}%T"
error="%B%{$fg[$err_color]%}Err %?%b"
reset="%{$reset_color%}"
num="%{$fg[$num_color]%}#%h"
computer="%b%{$fg[$computer_color]%}`hostname | cut -d"." -f1`%B"
#PS1="$computer $plogin $cpath $psym $reset"
#RPS1="%(?,$time,$error) $num$reset"

# Completion options
autoload mere zed zfinit
autoload incremental-complete-word
zle -N incremental-complete-word

# Always use emacs-mode
bindkey -e

# Bindkeys, easier life.
# bindkey i incremental-complete-word
# bindkey  history-incremental-search-backward
# bindkey \[1~ beginning-of-line
# bindkey \[7~ beginning-of-line
# bindkey \[4~ end-of-line
bindkey "^[[1;5D" beginning-of-line
bindkey "^[[1;5C" end-of-line
bindkey "\e[1;3C" forward-word
bindkey "\e[1;3D" backward-word
# bindkey kill-line
# bindkey  kill-whole-line
#bindkey  yank
#bindkey  vi-forward-word
#bindkey  vi-backward-word

fpath=(~/Config/zsh-completion $fpath)

autoload insert-files
autoload nslookup
autoload predict-on
autoload -U compinit
autoload complist
compinit
autoload -U bashcompinit
bashcompinit
autoload -U zmv

#unsetopt correct_all

zstyle ':completion:*' format '%{[32m%}--- %{[01m%}%d%{[0m%}'
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _complete _correct _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'l:|=* r:|=*' 'r:|[
._-]=* r:|=*'

zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select=5
zstyle ':completion:*' original true
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' verbose true
zstyle ':completion:*:processes' list-colors '=(#b)(?????)(#B)?????????????????????????????????([^ ]#/)#(#b)([^ /]#)*=00=01;31=01;33'
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' force-list always

zstyle ':completion:*:rm:*' ignore-line yes
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

zstyle ':completion:*:*:xdvi:*' menu yes select
zstyle ':completion:*:*:xdvi:*' file-sort time

#zstyle ':completion:*:*:docker:*' file-patterns 'Images'

# On the fly hostname list
if [ -f "${HOME}/.ssh/known_hosts" ]; then
  allprevioushosts="`cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e 's/,.*//g' | uniq | grep -v "\[" | tr '\n' ' '`"
else
  allprevioushosts=''
fi
zstyle '*:hosts' hosts localhost `echo ${allprevioushosts}`

export EDITOR=$MYEDITOR

# LS
case $OS in
      	FreeBSD) alias ls="$ls -w";;
      	Darwin|Linux) alias ls="$ls -v";;
        OpenBSD|NetBSD|SunOS) alias ls="$ls" ;;
        *) alias ls="$ls" ;;
esac

if [ "$OS" = 'Darwin' ]; then  # Hack pour Terminal
	export TERM='xterm-color'
fi
if [ "$OS" = 'Linux' ]; then
	if [ ! "`which htop`" = '' ]; then
		alias top="htop"
	fi
	alias grep="grep --color"
fi

if [ "$OS" = 'Darwin' ]; then
	alias log="tail -n 20 /var/log/system.log"
else
	alias log="tail -n 20 /var/log/messages"
fi

echo
echo "     Welcome "$USER" on `hostname` !"
echo

# Faire fonctionner backspace dans tous les cas
case $TERM in
    *xterm*|rxvt|(dt|k|E)term)
    	bindkey '^?' backward-delete-char
		bindkey "^[[3~"	delete-char
		;;
		esac

# Good for you :)
if [ "$TERM" '!=' 'linux' ]; then
  precmd() {print -Pn "\e]0;%n@%m: %~\a"}
fi
