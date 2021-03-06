hex(){
   printf "0x%x\n" $1
}

dec(){
   printf "%d\n" $1
}

pacsize() {
    for file in /var/lib/pacman/local/* ; do
        size="$(sed -n '/^%SIZE%$/{N;s/.*\n//p}'< $file/desc)"
        echo $((size / 1024/1024))MB ${file##*/}
    done | sort -n
}

mcd() {
    mkdir $1
    cd $1
}

unset_proxy() {
    unset ftp_proxy && unset http_proxy && unset https_proxy
}

colors() {
    local fgc bgc vals seq0

    printf "Color escapes are %s\n" '\e[${value};...;${value}m'
    printf "Values 30..37 are \e[33mforeground colors\e[m\n"
    printf "Values 40..47 are \e[43mbackground colors\e[m\n"
    printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

    # foreground colors
    for fgc in {30..37}; do
        # background colors
        for bgc in {40..47}; do
            fgc=${fgc#37} # white
            bgc=${bgc#40} # black

            vals="${fgc:+$fgc;}${bgc}"
            vals=${vals%%;}

            seq0="${vals:+\e[${vals}m}"
            printf "  %-9s" "${seq0:-(default)}"
            printf " ${seq0}TEXT\e[m"
            printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
        done
        echo; echo
    done
}

