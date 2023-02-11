#!/usr/bin/bash

# Version 3.0
# You can select a banner .txt file, it MUST contain 13 lines!!!!
# If banner not requested r.txt ,which is the default banner, will be used instead

export LANG=C.UTF-8

LIPV4="$(ip a | grep -Po "\d{1,4}\.\d{1,4}\.\d{1,4}\.\d{1,4}" | grep -Ev "127.0.0.*" | head -n1)"
MSG_=$(curl -s "https://type.fit/api/quotes" 2>/dev/null | jq '.[] | [.text]' | grep -e '"' | sort -R | head -n1)
AAA_=$(grep -Eo '["\x22].*["\x22]' -m1 /etc/lsb-release);

VERME="\033[1;31m"
VERME2="\033[0;31m"
VERDE="\033[1;32m"
ROXO="\033[1;95m"
FIM="\033[0;00m"

# #################################################### #
# Ideia:
# ./rofetch2 --banner r.txt

ARQ_="$2"
case "$ARQ_" in
  "-b"|"--banner") : ;;
  "") echo "Argumento faltando, arquivo \"r.txt\" setador por default"; ARQ_="r.txt" ;;
esac

#BANNER_="r.txt"
if [[ -z "$ARQ_" ]]; then
  echo "Nenhum banner selecionado"
else
  ARQ_="r.txt";
fi

IFS=$'\n' read -d '' -r -a lines < "$ARQ_" #r.txt
#echo "${lines[1]}"

# #################################################### #

# ASCII: https://www.twitchquotes.com/ascii-art-generator Width: 25
echo -e "\n${VERME2}${lines[0]}"
echo -e "${lines[1]}  ${VERDE}$USER${FIM}@${VERDE}$HOSTNAME${FIM}"
echo -e "${VERME2}${lines[2]}"
echo -e "${lines[3]}  ${VERME}OS${FIM}:\t\t\t ${AAA_//\"}" # Antigo: $(grep "PRETTY" /etc/os-release | cut -d"=" -f2 | tr -d '"')" #$(awk -F '=' '/^NAME=/ {print $2}' /etc/os-release 2>&- | tr -d '"')" OR lsb_release -ds (but it's slower somehow)
echo -e "${VERME2}${lines[4]}  ${VERME}Term & Font${FIM}:\t\t $(echo -ne "$TERM ($(tty))") / ($(grep -Eo '["\x22].*["\x22]' /etc/default/console-setup | sed -n '4,1p' | tr -d '"'""))" # Antigo: echo -e "${VERME2}⣿⣿⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿  ${VERME}Term${FIM}:\t\t $(echo -ne "$TERM ($(tty))")"
echo -e "${VERME2}${lines[5]}  ${VERME}IPv4 (Local)${FIM}:\t $(wget -q --spider "https://www.google.com/"; [[ "$?" == "0" ]]&& echo -e "${LIPV4} ${VERDE}(Connected)${FIM}" || echo -e "${LIPV4} ${VERME}(Not connected)${FIM}")"
echo -e "${VERME2}${lines[6]}  ${VERME}Kernel${FIM}:\t\t $(uname -smr)"
echo -e "${VERME2}${lines[7]}  ${VERME}Uptime${FIM}:\t\t $(uptime -p | sed 's/up //g')" # Antigo: $(uptime | awk '{print $3" "$4"s"}' | tr -d ',')" # Antigo: echo $(uptime) | sed 's/^.\+up\ \+\([^,]*\).*/\1/g'
echo -e "${VERME2}${lines[8]}  $(free -m | awk 'NR==2{printf "\033[1;31mMemory Usage\033[0m: \t %s / %sMiB (%.2f%%)\n", $3,$2,$3*100/$2 }')"
echo -e "${VERME2}${lines[9]}  ${VERME}Shell${FIM}:\t\t $(VERR_=$($SHELL --version); echo ${VERR_%%(*})" # OLD: $(ps | awk '{print $4}' | sed -n 2p | tr -d '-') ${BASH_VERSION%(*}"
echo -e "${VERME2}${lines[10]}  $([[ "$(echo $DESKTOP_SESSION)" == "" ]]&& echo -e "${VERME}DE${FIM}:\t\t\t No DE / Unknown" || echo -e "${VERME}DE${FIM}:\t\t\t $DESKTOP_SESSION")" # Antigo: echo -e "${VERME2}⣿⣿⣿⠀⠀⠀⠀⢻⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿  ${VERME}DE${FIM}:\t\t\t [[ "$(echo $DESKTOP_SESSION)" == "" ]]&& echo -e "No DE / Unknown" || echo "$DESKTOP_SESSION""
echo -e "${VERME2}${lines[11]}"
echo -e "${lines[12]}${ROXO}${MSG_//\"}${FIM}"
unset IPV4 MSG_ VERME VERME2 VERDE ROXO FIM VERR_ AAA_
exit 0

"FIM" <<EOF
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⠿⠿⠟⠛⠛⠛⠋⠉⠉⠉⠉⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⣿
⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿
⣿⣿⠀⠀⠀⠀⣿⣿⣿⣿⣿⣷⣶⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿
⣿⣿⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿
⣿⣿⡇⠀⠀⠀⠘⠛⠛⠛⠛⠛⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿
⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿
⣿⣿⡇⠀⠀⠀⣶⣶⣆⠀⠀⠀⠲⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⡇⠀⠀⠀⢹⣿⣿⣆⠀⠀⠀⠈⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣇⠀⠀⠀⠘⣿⣿⣿⣧⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⠀⠀⠀⠀⢻⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿
⣿⣿⣿⣀⣀⡀⠀⠈⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿
EOF
