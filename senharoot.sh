#!/bin/bash
# puto noob
# ojo esta mrd es free si sabes urgar hacelo mama webo @gatesccn
clear
[[ "$(whoami)" != "root" ]] && {
	clear
	echo -e "\033[1;31BUENO HORA DE HACERTE root y CAMBIAR TU CONTRASEÑA XD \033[1;32m(\033[1;33msudo -i\033[1;32m)\033[0m"
	exit
}
[[ $(grep -c "prohibit-password" /etc/ssh/sshd_config) != '0' ]] && {
	sed -i "s/prohibit-password/yes/g" /etc/ssh/sshd_config
} > /dev/null
[[ $(grep -c "without-password" /etc/ssh/sshd_config) != '0' ]] && {
	sed -i "s/without-password/yes/g" /etc/ssh/sshd_config
} > /dev/null
[[ $(grep -c "#PermitRootLogin" /etc/ssh/sshd_config) != '0' ]] && {
	sed -i "s/#PermitRootLogin/PermitRootLogin/g" /etc/ssh/sshd_config
} > /dev/null
[[ $(grep -c "PasswordAuthentication" /etc/ssh/sshd_config) = '0' ]] && {
	echo 'PasswordAuthentication yes' > /etc/ssh/sshd_config
} > /dev/null
[[ $(grep -c "PasswordAuthentication no" /etc/ssh/sshd_config) != '0' ]] && {
	sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
} > /dev/null
[[ $(grep -c "#PasswordAuthentication no" /etc/ssh/sshd_config) != '0' ]] && {
	sed -i "s/#PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
} > /dev/null
service ssh restart > /dev/null
iptables -F
iptables -A INPUT -p tcp --dport 81 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp --dport 8799 -j ACCEPT
iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
iptables -A INPUT -p tcp --dport 1194 -j ACCEPT
clear && echo -ne "\033[1;32mESCRIBE TU NUEVA CONTRASEÑA \033[1;37m: "; read senha
[[ -z "$senha" ]] && {
echo -e "\n\033[1;31mOYE TRANQUILO VIEJO ESCRIBI BIEN LA CONTRASEÑA WEON\033[0m"
exit 0
}
echo "root:$senha" | chpasswd
echo -e "\n\033[1;31m[ \033[1;33mDESENCRIPTADORESHC \033[1;31m]\033[1;37m - \033[1;32T  DESENCRIPTADORESH te dice AHORA SOS ROOT PRO \033[0m"
echo -e "\n\033[1;31m[ \033[1;33mDESENCRIPTADORESHC \033[1;31m]\033[1;37m - \033[1;32T  TAMBIEN TE DEJE UN REGALO QUE ES ABRIR TUS PUERTOS IPTABLES 81 80 443 8799 8080 1194 DE NADA \033[0m"
