#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
RED='\e[1;31m'
GREEN='\e[0;32m'
BLUE='\e[0;34m'
NC='\e[0m'
# Variable Warna
based="\e[39m"
danger="\e[91m"
warning="\e[93m"
success="\e[92m"

echo -e "\n[${warning}Permission$based] > Masukan Password :"
read -r -s Password
case "$Password" in
  evoteammalaysia )
    echo -e "\n[${success}SUCCESS$based] > Password benar"
    echo -e "[${warning}Output$based]  > Kamu diizinkan :)"
  ;;
  * )
    echo -e "\n[${danger}ERROR$based]  > Password salah"
    echo -e "[${warning}Output$based] > Kamu tidak diizinkan :'("
  ;;
esac

if [ -f "/etc/v2ray/domain" ]; then
echo "Script Already Installed"
exit 0
fi
mkdir /var/lib/premium-script;
echo "IP=" >> /var/lib/premium-script/ipvps.conf
wget https://raw.githubusercontent.com/iqooneo5/neo/main/cf.sh && chmod +x cf.sh && ./cf.sh
#install ssh ovpn
wget https://raw.githubusercontent.com/iqooneo5/neo/main/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
#sstp
wget https://raw.githubusercontent.com/iqooneo5/neo/main/sstp.sh && chmod +x sstp.sh && ./sstp.sh
#install ssr
wget https://raw.githubusercontent.com/iqooneo5/neo/main/ssr.sh && chmod +x ssr.sh && ./ssr.sh
#sodosok
wget https://raw.githubusercontent.com/iqooneo5/neo/main/sodosok.sh && chmod +x sodosok.sh && ./sodosok.sh
#installwg
wget https://raw.githubusercontent.com/iqooneo5/neo/main/wg.sh && chmod +x wg.sh && ./wg.sh
#install v2ray
wget https://raw.githubusercontent.com/iqooneo5/neo/main/ins-vt.sh && chmod +x ins-vt.sh && ./ins-vt.sh
#install L2TP
wget https://raw.githubusercontent.com/iqooneo5/neo/main/ipsec.sh && chmod +x ipsec.sh && ./ipsec.sh
#br-set
wget https://raw.githubusercontent.com/iqooneo5/neo/main/set-br.sh && chmod +x set-br.sh && ./set-br.sh
# Set Index
cd /home/vps/public_html
wget https://raw.githubusercontent.com/iqooneo5/myindex/main/index.html
#install ohp-server
wget https://raw.githubusercontent.com/iqooneo5/neo/main/ohp.sh && chmod +x ohp.sh && ./ohp.sh
cd
#install figlet & lolcat
sudo apt-get install figlet
sudo apt-get install ruby
sudo gem install lolcat

rm -f /root/ssh-vpn.sh
rm -f /root/sstp.sh
rm -f /root/wg.sh
rm -f /root/ss.sh
rm -f /root/ssr.sh
rm -f /root/ins-vt.sh
rm -f /root/ipsec.sh
rm -f /root/set-br.sh
rm -f /root/ohp.sh
cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=https://www.abidz.ga

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
history -c
echo "1.2" > /home/ver
clear
echo " "
sudo hostnamectl set-hostname SETUP-BY-OKKAYKAYYO
figlet -c Instalation Success | lolcat
echo " "
echo "--------------------------------------------------------------------------------" | tee -a log-install.txt
echo "================================= Premium Autoscript ===========================" | tee -a log-install.txt
echo "--------------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 442, OHP 8087"  | tee -a log-install.txt
echo "   - Stunnel4                : 443, 777"  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080 (limit to IP Server)"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 81"  | tee -a log-install.txt
echo "   - Wireguard               : 7070"  | tee -a log-install.txt
echo "   - L2TP/IPSEC VPN          : 1701"  | tee -a log-install.txt
echo "   - PPTP VPN                : 1732"  | tee -a log-install.txt
echo "   - SSTP VPN                : 444"  | tee -a log-install.txt
echo "   - Shadowsocks-R           : 1443-1543"  | tee -a log-install.txt
echo "   - SS-OBFS TLS             : 2443-2543"  | tee -a log-install.txt
echo "   - SS-OBFS HTTP            : 3443-3543"  | tee -a log-install.txt
echo "   - V2RAY Vmess TLS         : 8443"  | tee -a log-install.txt
echo "   - V2RAY Vmess None TLS    : 80"  | tee -a log-install.txt
echo "   - V2RAY Vless TLS         : 2083"  | tee -a log-install.txt
echo "   - V2RAY Vless None TLS    : 8880"  | tee -a log-install.txt
echo "   - Trojan                  : 2087"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "--------------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Malaysia (GMT +8)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [OFF]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "--------------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   - Script By               : EvoTeamMalaysia " | tee -a log-install.txt
echo "   - Telegram                : T.me/EvoTeamMalaysia"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "================================================================================" | tee -a log-install.txt
echo "-------------------------- Created By EvoTeamMalaysia ---------------------------" | tee -a log-install.txt
echo "================================================================================" | tee -a log-install.txt
echo ""
echo "	 Your VPS Will Be Automatical Reboot In 6 s"
rm -f install.sh
sleep 6
reboot