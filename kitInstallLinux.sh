#!/bin/sh
#Kit de configuracion server Linux Viva Dominicana
#by Ennunez 20160415

#AREA de Variables
DOMAIN="om.do"
NETMASK="255.255.255.0"
DNS1=3
DNS2=94
GWDMZ=38
GWLAN=1
DMZ=192.168.100.
LAN=172.18.244.
RUTARED="/etc/sysconfig/network-script/ifcg-"




#Funciones
Menu(){
	echo "Seleccione  la configuracion que desea Realizar" 
	echo ' 
	1) Configurar Hostname
	2) Configurar Interface de RED
	3) Instalar paquetes basicos 
	4) Instalar paquetes para Web Server
	5) Update Sistema Opetativo
	6) Tareas Luego de instalar server Despues de instalar Server.
	7) SNMP Y OPM
	q) Salir.
	'
	read opmenu
	case $opmenu in
	
		 1) hostname ;; 
         2) interface ;;
         3) paquetes ;;
         4) webserver ;;
         5) update ;;
         6) all ;;
         7) snmp ;;
         q) exit ;;

	esac
}


hostname() { 
	echo "Introduzca el nombre del equipo"
	echo "Solo este proceso solo es valido para centos 7"
	read HOSTNAME
	hostnamectl --set-hostname  $HOSTNAME
	clear
	Menu
}

interface() {
	echo "Introduzca 1 si el server estara en la dmz 2 si es en la red de servidores"
read OP
if [ $OP = 1 ]
 then
        echo "DMZ"
        echo "Introduzca la dirrecion ip del servidor "
        read IP
        echo
        echo "Introduzca el nombre de la interface "
        read IF
        echo
        echo "IPADDDR="$DMZ$IP
        echo "NETMASK="$NETMASK
        echo "GATEWAY="$DMZ$GWDMZ
        echo "DNS1="$DMZ$DNS1
        echo "DNS2="$DMZ$DNS2
        echo "DOMAIN="$DOMAIN
        if [ -f $RUTARED$IF ]
         then
                sed -i 's/ONBOOT=no/ONBOOT=yes/g' $RUTARED$IF
                echo "IPADDDR="$DMZ$IP >> $RUTARED$IF
                echo "NETMASK="$NETMASK >> $RUTARED$IF
                echo "GATEWAY="$DMZ$GWDMZ >> $RUTARED$IF
                echo "DNS1="$DMZ$DNS1 >> $RUTARED$IF
                echo "DNS2="$DMZ$DNS2 >> $RUTARED$IF
                echo "DOMAIN="$DOMAIN >> $RUTARED$IF
                echo "Configuracion relizada"
         else
                echo "La Interface no existe"
                interface
         fi
        echo "____________________________"
        echo "Configuracion realizada"
        echo "____________________________"
        cat $RUTARED$IF
        echo "____________________________"
elif [ $OP = 2 ]
 then
        echo "LAN"
        echo "Introduzca la dirrecion ip del servidor "
        read IP
        echo
        echo "Introduzca el nombre de la interface "
        read IF
        echo
        echo
        echo "IPADDDR="$LAN$IP
        echo "NETMASK="$NETMASK
        echo "GATEWAY="$LAN$GWDMZ
	echo "DNS1="$LAN$DNS1
        echo "DNS2="$LAN$DNS2
        echo "DOMAIN="$DOMAIN
        if [ -f $RUTARED$IF ]
         then
                sed -i 's/ONBOOT=no/ONBOOT=yes/g' $RUTARED$IF
                echo "IPADDDR="$LAN$IP >> $RUTARED$IF
                echo "NETMASK="$NETMASK >> $RUTARED$IF
                echo "GATEWAY="$LAN$GWDMZ >> $RUTARED$IF
                echo "DNS1="$LAN$DNS1 >> $RUTARED$IF
                echo "DNS2="$LAN$DNS2 >> $RUTARED$IF
                echo "DOMAIN="$DOMAIN >> $RUTARED$IF
                echo "Configuracion relizada"
         else
                echo "La Interface no existe"
                interface
         fi
        echo "____________________________"
        echo "Configuracion realizada"
        echo "____________________________"
        cat $RUTARED$IF
        echo "____________________________"
else
        echo "No  es una opcion valida"
        interface
fi
Menu
}

paquetes() {
echo "Se instalaran herramientas de utilizacion basicas para un sysadmin y se realizara la preparacion para la Instalacion de FIM"
echo "Paquetes basicos net-snmp nmap vim"
	yum install net-snmp nmap vim -y
	echo "Configuracion para el FIM"
	yum install glibc.i686
	yum upgrade libgcc
	yum install libgcc.i686 
	yum install libacl.i686 
	yum upgrade libstdc++
	yum install libstdc++.i686
	yum upgrade zlib
	yum install zlib.i686
	echo "Herramientas instaladas"
	echo 
	Menu
}

webserver(){
	"Instalacion de paquetes basicos de apache y php"
	yum install -y http php 
	echo "Esto solo realiza las de paquetes basicos."
	Menu
}

update() {
	yum update 
	echo "Sistema actulizado."
	Menu
}

snmp(){
	echo "Instalacion y configuracion snmp linux viva default"
	echo "Introduzca el nombre o del servidor a configurar "
	read HOSTIP
	echo
	echo "instalando snmp"
	ssh -v -l root $HOSTIP yum install net-snmp
	echo
	echo "Configuracion de SNMP"
	scp snmp* root@$HOSTIP:~/script/test/
	echo
	ssh -l root $HOSTIP /etc/init.d/snmpd start
	echo
	echo "Configuracion de Usuario para OPM y APM"
	ssh -l root $HOSTIP adduser consult_opm
	echo
	ssh -l root $HOSTIP passwd consult_opm
	echo
	Menu
}

all() { 
 echo "hola"
	Menu
}
Menu



