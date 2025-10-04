# Shows unstaged '*' and staged '+' changes
GIT_PS1_SHOWDIRTYSTATE=1

# Shows '$' if there is stashed state
GIT_PS1_SHOWSTASHSTATE=1

# Shows '%' if there are untracked files
GIT_PS1_SHOWUNTRACKEDFILES=1

# Shows '|CONFLICT' if there are unresolved conflicts
GIT_PS1_OMITSPARSESTATE='yes'

GIT_PS1_SHOWCOLORHINTS=1

GIT_PS1_SHOWUPSTREAM='verbose'

# Function to format duration in human-readable format
format_duration() {
    local duration=$1
    local hours=$((duration / 3600))
    local minutes=$(((duration % 3600) / 60))
    local seconds=$((duration % 60))
    local milliseconds=$((($2 % 1000000) / 1000))

    if [[ $hours -gt 0 ]]; then
        printf "%dh%dm%ds" $hours $minutes $seconds
    elif [[ $minutes -gt 0 ]]; then
        printf "%dm%ds" $minutes $seconds
    elif [[ $seconds -gt 0 ]]; then
        printf "%d.%03ds" $seconds $milliseconds
    else
        # For sub-second durations, show in milliseconds
        printf "%dms" $milliseconds
    fi
}

# Start timer - write to temp file
timer_start() {
    echo "$EPOCHREALTIME" > "${TMPDIR:-/tmp}"/.bash_timer_$$
}

# Stop timer and calculate duration
timer_stop() {
    if [[ -f "${TMPDIR:-/tmp}"/.bash_timer_$$ ]]; then
        local start_time=$(cat "${TMPDIR:-/tmp}"/.bash_timer_$$)
        local end_time=$EPOCHREALTIME

        local duration_float=$(echo "$end_time - $start_time" | bc)

        local duration_seconds=${duration_float%.*}
        local duration_nanos=${duration_float#*.}

        [[ -z "$duration_seconds" ]] && duration_seconds=0
        [[ -z "$duration_nanos" ]] && duration_nanos=0

        duration_seconds=$((10#$duration_seconds))
        duration_nanos=$((10#$duration_nanos))

        LAST_COMMAND_DURATION=$(format_duration $duration_seconds $duration_nanos)
        rm -f "${TMPDIR:-/tmp}"/.bash_timer_$$
    else
        LAST_COMMAND_DURATION="0s"
    fi
}

# PS0 executes after Enter is pressed, before command runs
PS0='$(timer_start)'

# PROMPT_COMMAND executes before displaying prompt, after command finishes
PROMPT_COMMAND='timer_stop'

# Default value on first load of shell
LAST_COMMAND_DURATION="0s"

__mkps1_duration() {
  echo '(${LAST_COMMAND_DURATION:-unknown})'
}

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

    echo "\[${BG_GRAY}${white}\] \t $(__mkps1_duration)\[${reset}\]"
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
