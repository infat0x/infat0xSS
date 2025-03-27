#!/bin/bash

printf '\e[8;45;100t'
xdotool getactivewindow windowmove $(($(xdpyinfo | grep dimensions | awk '{print $2}' | cut -d'x' -f1) / 2 - 750)) $(($(xdpyinfo | grep dimensions | awk '{print $2}' | cut -d'x' -f2) / 2 - 525))

GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m' 
line_count=$(wc -l < payloadDB/xss.txt)

clear
echo -e "${YELLOW} ${NC}"
echo -e "${YELLOW} ${NC}"
echo -e "${RED}		 ██▓ ███▄    █   █████▒▄▄▄     ▄▄▄█████▓▒██   ██▒  ██████   ██████  ${NC}"
echo -e "${RED}		▓██▒ ██ ▀█   █ ▓██   ▒▒████▄   ▓  ██▒ ▓▒▒▒ █ █ ▒░▒██    ▒ ▒██    ▒  ${NC}"
echo -e "${RED}		▒██▒▓██  ▀█ ██▒▒████ ░▒██  ▀█▄ ▒ ▓██░ ▒░░░  █   ░░ ▓██▄   ░ ▓██▄    ${NC}"
echo -e "${RED}		░██░▓██▒  ▐▌██▒░▓█▒  ░░██▄▄▄▄██░ ▓██▓ ░  ░ █ █ ▒   ▒   ██▒  ▒   ██▒ ${NC}"
echo -e "${RED}		░██░▒██░   ▓██░░▒█░    ▓█   ▓██▒ ▒██▒ ░ ▒██▒ ▒██▒▒██████▒▒▒██████▒▒ ${NC}"
echo -e "${RED}		░▓  ░ ▒░   ▒ ▒  ▒ ░    ▒▒   ▓▒█░ ▒ ░░   ▒▒ ░ ░▓ ░▒ ▒▓▒ ▒ ░▒ ▒▓▒ ▒ ░ ${NC}"
echo -e "${RED}		 ▒ ░░ ░░   ░ ▒░ ░       ▒   ▒▒ ░   ░    ░░   ░▒ ░░ ░▒  ░ ░░ ░▒  ░ ░ ${NC}"
echo -e "${RED}		 ▒ ░   ░   ░ ░  ░ ░     ░   ▒    ░       ░    ░  ░  ░  ░  ░  ░  ░   ${NC}"
echo -e "${RED}		 ░           ░              ░  ░         ░    ░        ░        ░   ${NC}"
echo -e "${RED}		 																     ${NC}"

                                    
 
echo -e "${YELLOW} ${NC}"
echo -e "${YELLOW} ${NC}"

echo -e "${YELLOW}  	================================================================================${NC}"
echo -e "${BLUE}   	 	     🛡️ XSS SCAN TOOL 🛡️                   \uF09B github.com/infat0x        ${NC}"
echo -e "${YELLOW}  	================================================================================${NC}"
function exit_script {
	echo -e "${RED}🚫 Exiting the script. Goodbye!${NC}"
	exit 0
}

echo " Select your language / Select language:"
echo " 1) Engish"
echo " 2) Azərbaycanca"
echo " 3) Türkçe"
echo " x) Exit"	
read -p " Select (1/2/3/x): " lang

if [ "$lang" == "x" ]; then
	exit_script
elif [ "$lang" == "1" ]; then
	GREETING="Hello!"
	echo -e "${GREEN}Please pay attention to the following information:${NC}"

	echo -e "${YELLOW}🎯 Target URL must be entered in the format ${RED}{'http{s}://example.com/?q= '}${NC}.${NC}" 
	echo -e "${YELLOW}📂 Successful XSS vulnerabilities will be logged in the ${RED}logs/${NC} folder according to the URL.${NC}"
	
	echo -e "${YELLOW}===============================================================================${NC}"
	echo -e "${RED}📢 WARNING: You should only use this tool for legal security testing purposes.${NC}"
	echo -e "${YELLOW}===============================================================================${NC}"

	read -p "⚠️  Do you want to proceed? (y/n): " confirm
	if [[ $confirm != "y" ]]; then
		echo -e "${RED}🚫 Operation canceled.${NC}"
		exit 1
	fi

	clear

	echo -e "${GREEN}🚀 Starting the attack...${NC}"
	echo -e "${YELLOW}${line_count} Payloads will be tested...${NC}"
	echo -e "${GREEN}⚔️ Running the XSS tool...${NC}"

	python3 ./src/infat0xss.py

elif [ "$lang" == "2" ]; then
	GREETING="Salam!"
	echo -e "${GREEN}Zəhmət olmasa aşağıdakı məlumatlara diqqət yetirin:${NC}"

	echo -e "${YELLOW}🎯 Hədəf URL ${RED}{'http{s}://example.com/?q= '}${NC} formatında daxil edilməlidir.${NC}" 
	echo -e "${YELLOW}📂 Uğurlu olan XSS zəiflikləri ${RED}logs/${NC} folderində URL-ə uyğun şəkildə qeyd ediləcək.${NC}"
	
	echo -e "${YELLOW}===============================================================================${NC}"
	echo -e "${RED}📢 XƏBƏRDARLIQ: Bu aləti yalnız qanuni təhlükəsizlik testləri üçün istifadə etməlisiniz.${NC}"
	echo -e "${YELLOW}===============================================================================${NC}"

	read -p "⚠️  Davam etmək istəyirsinizmi? (b/x): " confirm
	if [[ $confirm != "b" ]]; then
		echo -e "${RED}🚫 Əməliyyat ləğv edildi.${NC}"
		exit 1
	fi

	clear

	echo -e "${GREEN}🚀 Hücum başlayır...${NC}"
	echo -e "${YELLOW}${line_count} Payload sınaqdan keçiriləcək...${NC}"
	echo -e "${GREEN}⚔️ XSS aləti işə salınır...${NC}"

	python3 ./src/infat0xss.py

elif [ "$lang" == "3" ]; then
	GREETING="Merhaba!"
	echo -e "${GREEN}Lütfen aşağıdaki bilgilere dikkat ediniz:${NC}"

	echo -e "${YELLOW}🎯 Hedef URL ${RED}{'http{s}://example.com/?q= '}${NC} şeklinde girilmelidir.${NC}" 
	echo -e "${YELLOW}📂 Başarılı XSS açıkları ${RED}logs/${NC} klasörüne URL'ye uygun şekilde kaydedilecektir.${NC}"
	
	echo -e "${YELLOW}===============================================================================${NC}"
	echo -e "${RED}📢 UYARI: Bu aracı yalnızca yasal güvenlik testi amaçları için kullanmalısınız.${NC}"
	echo -e "${YELLOW}===============================================================================${NC}"

	read -p "⚠️  Devam etmek istiyor musunuz? (e/h): " confirm
	if [[ $confirm != "e" ]]; then
		echo -e "${RED}🚫 İşlem iptal edildi.${NC}"
		exit 1
	fi

	clear

	echo -e "${GREEN}🚀 Saldırı başlatılıyor...${NC}"
	echo -e "${YELLOW}${line_count} Payload denenecek...${NC}"
	echo -e "${GREEN}⚔️ XSS aracı çalıştırılıyor...${NC}"

	python3 ./src/infat0xss.py
else
	GREETING="Invalid selection!"
fi
