#==========================Colors===========================
NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGRAY='\033[0;37m'
DARKGRAY='\033[1;30m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHTBLUE='\033[1;34m'
LIGHTPURPLE='\033[1;35m'
LIGHTCYAN='\033[1;36m'
WHITE='\033[1;37m'
#===========================Alias============================
# directory change
alias dv="dirs -v"
alias pd=jump_to_dir

# proxy
alias pxon="export http_proxy=127.0.0.1:8889; export https_proxy=127.0.0.1:8889"
alias pxoff="unset http_proxy; unset https_proxy"

# keyboard setting
alias kboff="xinput disable 'AT Translated Set 2 keyboard'"
alias kbon="xinput enable 'AT Translated Set 2 keyboard'"
#=========================Function===========================
# change directory by num
function jump_to_dir() {
    if [ "$1" != "" ] ;then
        pushd -$1 &> /dev/null
        echo -e "${RED}Jump${NOCOLOR} to ${GREEN}${PWD}${NOCOLOR}"
    else
        echo "switch stack top"
        pushd &> /dev/null
#pushd &> /dev/null
    fi
}
#===========================End==============================
