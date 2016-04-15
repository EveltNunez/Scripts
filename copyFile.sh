#!/bin/bash
#CopyFiles de la Estructura de anaiboa
#by Enunez


#VARIABLES
NEWRUTA=/Bills/omega/
OLDRUTAOMEGA=/omega/
OLDRUTABILLS=/Bills/
OLDRUTAVAR=/var/www/omega/apps/supreme/
OLDRUTADATAPROD=/Data_Omega_Prod/
CP="cp `-pr`"

COPYOMEGA=("imsis/"
"subsidio/"
"save/"
"devolucion/"
"categoria/"
"procedencia/"
"seedstock/"
"transferencia/"
"spc/"
"limbo/"
"despacho_did/"
"files/"
"upload/"
"upload/order/"
"upload/transfer/"
"upload/movimiento/"
"upload/reingreso/"
"upload/ajuste/"
"upload/cambiar_codigo/"
"files/order/"
"files/transfer/"
"files/cerrar_oc/"
"files/reingreso/"
"files/cambiar_codigo/"
"upload/ptos_masivos/"
"contrato/"
"salida/"
"cargado_precio/"
"cargado_notcredeb/"
"asignacion_abogados/"
"ajuste_masivo/"
"xmlrpc/"
"rma/files/upload/"
"reporte_recargas/"
"reporte_nz/"
"files/devueltos_consignacion/"
"rep_consignacion/"
"files/cambio_consignacion/"
"files/aplausos/"
"refurbished/")

#validar ruta
COPYVARIOS=/var/www/omega/apps/facturas/imagenes/campanias_facturas

COPYBILLS=("facturas_caja/"
"docs_exencion/"
"notas/credito/"
"notas/debito/"
"detalle_llamadas/"
"notas/credito_caja"
"facturas_dealer")

COPYVAR=("views/_images/oferta_articulos/"
"views/_files/aplausos/"
"views/_images/fotos/"
"views/_files/cicla/"
"views/_files/padron/"
"views/_files/padron/archivos_xml_errores/"
"views/_files/ret_files/"
"views/_files/ret_files/old/"
"views/_files/ret_files/log/"
""
)
COPYDATAPROD=omega/comisiones

#rutas en /omega
for a in ${COPYOMEGA[*]};
do
if [ -d $OLDRUTAOMEGA$a ]
then
echo "Existe "$OLDRUTAOMEGA$a $NEWRUTA$a
#rsync -av $OLDRUTAOMEGA$a $NEWRUTA$a
else
echo "NO "$OLDRUTAOMEGA$a
fi
done;
#rutas en /BILLS
for b in ${COPYBILLS[*]};
do
if [ -d $OLDRUTABILLS$b ]
then
echo "Existe"$OLDRUTABILLS$b""$NEWRUTA$b
rsync -av  $OLDRUTABILLS$b $NEWRUTA$b
else
echo "NO "$OLDRUTABILLS$b
fi
done;

#Rutas en /var
for a in ${COPYVAR[*]};
do
if [ -d $OLDRUTAVAR$a ]
then
echo "Existe "$OLDRUTAVAR$a"--->"$NEWRUTA$a
$OLDRUTAVAR$a"--->"$NEWRUTA$a
else
echo "NO "$OLDRUTAVAR$a
fi
done;


#RUTAS en DATA_PROD_OMEGA
if [ -d $OLDRUTADATAPROD$COPYDATAPROD ]
then 
	echo "exite"$OLDRUTADATAPROD$COPYDATAPROD
# $CP $OLDRUTADATAPROD$COPYDATAPROP $NEWRUTA$
else
	echo "No existe"$OLDRUTADATAPROD$COPYDATAPROD
fi

#COPIA CONTRATOS Y IVR DESDE TMP
#$CP /tmp/contrato* $NEWRUTA/contrato
#$CP /tmp/irv* $NEWRUTA/ivr/
#$CP $COPYVARIOS $NEWRUTA/apps/facturas/imagenes/campanias_facturas
