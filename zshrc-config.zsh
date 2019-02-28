# /etc/zprofile
# /etc/zshrc

export GDBHISTFILE=~/.gdb_history

OFF="\e[m";

BOLD="\e[1m";
DIM="\e[2m";
ITALIC="\e[3m";
UNDERLINE="\e[4m";
BOLD_UNDERLINE="\e[1;4m";
BLINK="\e[5m";
INVERT="\e[7m";
HIDDEN="\e[8m";

BLACK="\e[30m";
RED="\e[31m";
GREEN="\e[32m";
YELLOW="\e[33m";
BLUE="\e[34m";
WHITE="\e[97m";

# eval `ssh-agent`
# ssh-add

# export SCALA_HOME=/Users/Shared/Scala/Software
# export PATH=${PATH}:/Users/Shared/Software/Scala/bin

# export MAVEN_HOME=/Users/Shared/Software/Maven
# export PATH=${PATH}:$MAVEN_HOME/bin

# export SPARK_HOME=/Users/Shared/Software/Spark
# export PATH=${PATH}:$SPARK_HOME/bin

# To have Spark in a regular python interpreter
#export PYTHONPATH=$PYTHONPATH:$SPARK_HOME/python/lib/py4j-0.10.4-src.zip:$SPARK_HOME/python/

#export JAVA_HOME=$(/usr/libexec/java_home)

#export PATH=${PATH}:/Users/Shared/Software/Automake:/Users/Shared/Software/Autoconf

#export PATH=$HOME/Software/anaconda2/bin:$PATH

#export PATH=${PATH}:$HOME/Software/javacc-5.0/bin

#CLANG_OPENMP=$HOME/Library/openmp

# To add Clang openmp to include path and lib path for the compiler
#export CPATH=${CPATH}:${CLANG_OPENMP}/include
#export LIBRARY_PATH=${LIBRARY_PATH}:${CLANG_OPENMP}/lib

# To add openmp to the path for runtime library search
#export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${CLANG_OPENMP}/lib

#ISPELL=$HOME/Library/ispell/lib/usr/local

#export PATH=${PATH}:${ISPELL}/bin:${ISPELL}/lib:${ISPELL}/man

#export PATH=${PATH}:$MY_MODELICA_INSTALL/bin

export CORRECT_IGNORE_FILE='Images|Help|.git'

# To load MPI module, as openmpi is not isntalled in path, /usr/lib64/openmpi/bin
# https://fedoraproject.org/wiki/Packaging:EnvironmentModules?rd=Packaging/EnvironmentModules
# https://fedoraproject.org/wiki/Packaging:MPI
#module load mpi/openmpi-x86_64

# export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.151-1.b12.fc25.x86_64
export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:/bin/java::")

#export GROOVY_HOME=~/Software/groovy

# To install spark hadoop luarocks

# xhost +ip
# export DISPLAY=163.104.10.162:0.0
# export DISPLAY=client.exemple.org:0.0
# xterm &
# https://linux.developpez.com/formation_debian/export-display.html
# Not possible need to deactivate notcplisten on X11

export PATH=$PATH:$HOME/.cargo/bin

export PATH=$PATH:$HOME/Software/npm/bin
export NODE_PATH=$NODE_PATH:$HOME/Software/npm/lib/node_modules

#export PYTHONPATH=$PYTHONPATH:$HOME/Software/anaconda2/pkgs/pygtk-2.16.0-0

# To add default directories to search when using cd
#export CDPATH=

export GEM_HOME=$HOME/Software/gem
export PATH=$PATH:$GEM_HOME/bin

#export PYTHONPATH=$HOME/Library/pygments/lib/python2.7/site-packages/:$PYTHONPATH
#export PYTHONPATH=$HOME/Library/pip/grip:$PYTHONPATH

export PYTHONUSERBASE=~/.local/pip

export GOPATH=$HOME/Software/go
export PATH=$PATH:$GOPATH/bin

PIP_LOCAL_PATH=$HOME/.local/pip
export PATH=$PATH:$PIP_LOCAL_PATH/bin

if [ -f "$CONFIG_PATH/zshrc-config-rte.zsh" ]; then
  . $CONFIG_PATH/zshrc-config-rte.zsh
fi
