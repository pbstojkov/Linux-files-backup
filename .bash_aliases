# to make the prompt a bit better
case "$TERM" in
    xterm|xterm-color|*-256color) color_prompt=yes;;
esac

get_git_branch() {
    # git branch 2> /dev/null | grep [*] | grep -o "[^* ]*"
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@ \[\033[01;34m\]\W'
    PS1="$PS1\[\033[33m\]\$(get_git_branch) \[\033[00m\]\$ "
else
    PS1='${debian_chroot:+($debian_chroot)}\u@ \W'
    PS1="$PS1\$(get_git_branch) \$ " # no idea if this is working or not
fi
unset color_prompt force_color_prompt
# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@ \W\a\]$PS1"
    ;;
*)
    ;;
esac

# to see content of the folder you just cd-ed in.
function cd {
    builtin cd "$@" && ls -F
}

alias tar-unzip="tar -xvzf"
alias cd..="cd .."
alias py="python3"
alias py2="python"
alias ffs="~/Projects/linux_Stuff/fixTouchpad.sh | ~/xinitrc.sh | echo FIXED!"

eval "$(thefuck --alias)"
# You can use whatever you want as an alias, like for Mondays:
eval "$(thefuck --alias FUCK)"

alias light_ssh="sshpass -p tue321 ssh pi@192.168.0.107"
# everytime you change the IP, a manual ssh to it needs to be done to add the host to the known hosts list.
alias camera_ssh="sshpass -p tue321 ssh pi@192.168.0.109"

# to fix the annoying unreadable dir names
eval "$(dircolors ~/.dircolors)";

# volume change through ssh made easy
set_vol() {
    pactl set-sink-volume 1 $1%
}
