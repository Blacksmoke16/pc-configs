# Shows unstaged '*' and staged '+' changes
GIT_PS1_SHOWDIRTYSTATE=1

# Shows '$' if there is stashed state
GIT_PS1_SHOWSTASHSTATE=1

# Shows '%' if there are untracked files
GIT_PS1_SHOWUNTRACKEDFILES=1

GIT_PS1_SHOWCOLORHINTS=1

GIT_PS1_SHOWUPSTREAM="verbose"

__mkps1_debian_chroot() {
    # This string is intentionally single-quoted:
    # It will be evaluated when $PS1 is evaluated to generate the prompt each time.
    echo '${debian_chroot:+($debian_chroot)}';
}

__mkps1_inject_exitcode() {
    local code=$1

    if [ "$code" -ne "0" ]; then
        echo " $code "
    fi
}

__mkps1_exitcode() {
    local bg_red=`tput setab 1`;
    local white=`tput setaf 15`;
    local reset=`tput sgr0`;

    # We need to run a function at runtime to evaluate the exitcode.
    echo "\[${bg_red}${white}\]\$(__mkps1_inject_exitcode \$?)\[${reset}\]"
}

__mkps1_time() {
    local BG_GRAY=`tput setab 240`;
    local white=`tput setaf 7`;
    local reset=`tput sgr0`;

    echo "\[${BG_GRAY}${white}\] \t \[${reset}\]"
}

__mkps1_username() {
    local cyan=`tput setaf 45`;
    local reset=`tput sgr0`;

    echo "\[${cyan}\] \u \[${reset}\]";
}

__mkps1_workdir() {
    local bold=`tput bold`;
    local cyan=`tput setaf 45`;
    local reset=`tput sgr0`;

    echo "\[${bold}${cyan}\]\w\[${reset}\]";
}

__mkps1_git() {
    local magenta=`tput setaf 213`;
    local reset=`tput sgr0`;

    # Escaping the $ is intentional:
    # This is evaluated when the prompt is generated.
    echo "\$(__git_ps1 ' (\[${magenta}\]%s\[${reset}\])')"
}

__mkps1_box_top() {
    local cyan=`tput setaf 45`;
    local reset=`tput sgr0`;
    echo "\[${cyan}\]╭\[${reset}\]"
}

__mkps1_box_bottom() {
    local cyan=`tput setaf 45`;
    local reset=`tput sgr0`;
    echo "\[${cyan}\]╰\[${reset}\]"
}


__mkps1_user_prompt() {
    local bold=`tput bold`;
    local reset=`tput sgr0`;
    
    echo "\[${bold}\]\$\[${reset}\] ";
}
