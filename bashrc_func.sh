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
        echo "jump to $1"
        pushd -$1 &> /dev/null
    else
        echo "switch stack top"
        pushd &> /dev/null
    fi
}
#===========================End==============================
