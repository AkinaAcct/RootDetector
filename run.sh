#!/usr/bin/env bash
#NOTE: Probably not credible.

R="\033[1;31m"  # RED
Y="\033[1;33m"  # YELLOW
B="\033[40;34m" # BLUE
RE="\033[0m"    # RESET

check_magisk() {
    RESU="$(pm list packages --show-versioncode 2>&1 </dev/null | cat | grep -i magisk)"
    if [[ -n $RESU ]]; then
        MAGISKMANAGER=true
    fi
    for i in magisk magisk32 magiskinit resetprop magiskpolicy su supolicy; do
        if [[ -e $i ]]; then
            MAGISK=true
        fi
    done
    if [[ "${MAGISKMANAGER}" == "true" ]]; then
        printf "${Y}Magisk Manager detected.${RE}\n"
    elif [[ "${MAGISK}" == "true" ]]; then
        printf "${R}Magisk detected.${RE}\n"
    fi
}
check_ksu() {
    printf "${B}Developing...${RE}\n"
}

check_apatch() {
    printf "${B}Developing...${RE}\n"
}

print_result() {
    printf "${B}Below are the results:${RE}\n"
    cat <<-EOF
    MAGISK=true
    MAGISKMANAGER=true
EOF
}
for i in magisk ksu apatch; do
    printf "${B}%s${RE}\n" "Checking ${i}..."
    check_$i
done
print_result
