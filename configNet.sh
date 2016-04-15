#!/bin/sh
#Script para deploy de server nuevos.
#by Enunez

#Variables de red
DOMAIN="om.do"
NETMASK="255.255.255.0"
DNS1=3
DNS2=94
GWDMZ=38
GWLAN=1
DMZ=192.168.100.
LAN=172.18.244.

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
	if [ -f ifcg-$IF ] 
	 then
		sed -i 's/ONBOOT=no/ONBOOT=yes/g' ifcg-$IF
		echo "IPADDDR="$DMZ$IP >> ifcg-$IF
        	echo "NETMASK="$NETMASK >> ifcg-$IF
        	echo "GATEWAY="$DMZ$GWDMZ >> ifcg-$IF
        	echo "DNS1="$DMZ$DNS1 >> ifcg-$IF
        	echo "DNS2="$DMZ$DNS2 >> ifcg-$IF
        	echo "DOMAIN="$DOMAIN >> ifcg-$IF
	 	echo "Configuracion relizada"
	 else
		echo "La Interface no existe"
		exit
	 fi
	echo "____________________________"
	echo "Configuracion realizada"
	echo "____________________________"
	cat ifcg-$IF
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
	echo "GATEWAY="$LAN$GWLAN
	echo "DNS1="$LAN$DNS1
	echo "DNS2="$LAN$DNS2
	echo "DOMAIN="$DOMAIN
	if [ -f ifcg-$IF ] 
	 then
		sed -i 's/ONBOOT=no/ONBOOT=yes/g' ifcg-$IF
		echo "IPADDDR="$LAN$IP >> ifcg-$IF
        	echo "NETMASK="$NETMASK >> ifcg-$IF
        	echo "GATEWAY="$LAN$GWDMZ >> ifcg-$IF
        	echo "DNS1="$LAN$DNS1 >> ifcg-$IF
        	echo "DNS2="$LAN$DNS2 >> ifcg-$IF
        	echo "DOMAIN="$DOMAIN >> ifcg-$IF
	 	echo "Configuracion relizada"
	 else
		echo "La Interface no existe"
		exit
	 fi
	echo "____________________________"
	echo "Configuracion realizada"
	echo "____________________________"
	cat ifcg-$IF
	echo "____________________________"
else
	echo "No  es una opcion valida"
	exit 
fi


