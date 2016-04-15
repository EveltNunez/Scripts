#!/bin/bash
#CopyFiles de la Estructura de anaiboa
#by Enunez


#VARIABLES
NEWRUTA=/Bills/omega/
OLDRUTAOMEGA=/omega/
OLDRUTABILLS=/Bills/
OLDRUTAVAR=/var/www/omega/apps/supreme/
OLDRUTADATAPROD=/Data_Omega_Prod/

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
"asignacion_abogados"
"ajuste_masivo"
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
COPYVARIOS=/var/www/omega/apps/facturas/imagenes/campanias_facturas/

COPYBILLS=("facturas_caja/"
"docs_exencion/"
"notas/credito/"
"notas/debito/"
"detalle_llamadas/"
"notas/credito_caja/"
"facturas_dealer/")

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
COPYDATAPROD=omega/comisiones/

#################################################
###############rutas en /omega###################
#################################################
for a in ${COPYOMEGA[*]};
do
if [ -d $OLDRUTAOMEGA$a ]
then
echo "Comparacion de peso  de rutas Sincronizadas "$OLDRUTAOMEGA$a $NEWRUTA$a
rsync -av $OLDRUTAOMEGA$a $NEWRUTA$a
du -sh $OLDRUTAOMEGA$a 
du -sh $NEWRUTA$a
echo
else
echo "NO "$OLDRUTAOMEGA$a
fi
done;



#################################################
###############rutas en /BILLS###################
#################################################
for b in ${COPYBILLS[*]};
do
if [ -d $OLDRUTABILLS$b ]
then
echo "Comparacion de Rutas "$OLDRUTABILLS$b" "$NEWRUTA$b
#rsync -av  $OLDRUTABILLS$b" "$NEWRUTA$b
du -sh  $OLDRUTABILLS$b
du -sh  $NEWRUTA$b
echo
else
echo "NO "$OLDRUTABILLS$b
fi
done;
#
#################################################
##################Rutas en /var##################
#################################################
for a in ${COPYVAR[*]};
do
if [ -d $OLDRUTAVAR$a ]
then
echo "Peso de Ruta "$OLDRUTAVAR$a
du -sh $OLDRUTAVAR$a
echo
else
echo "NO "$OLDRUTAVAR$a
fi
done;

#peso NewRuta /var
du -sh /Bills/omega/oferta_articulos/

echo
du -sh /Bills/omega/aplausos/
echo
du -sh /Bills/omega/fotos/
echo
du -sh /Bills/omega/transunion/cicla/
echo
du -sh /Bills/omega/transunion/padron/
echo
du -sh /Bills/omega/transunion/padron/archivos_xml_errores/
echo
du -sh /Bills/omega/ret_files/
echo
du -sh /Bills/omega/ret_files/old/
echo
du -sh /Bills/omega/ret_files/log/
echo



#RUTAS en DATA_PROD_OMEGA
if [ -d $OLDRUTADATAPROD$COPYDATAPROD ]
then 
	echo "Comparacion de peso derutas "$OLDRUTADATAPROD$COPYDATAPROD
rsync -av $OLDRUTADATAPROD$COPYDATAPROD $NEWRUTA"comisiones/"
 du -sh $OLDRUTADATAPROD$COPYDATAPROD
 du -sh $NEWRUTA"comisiones/"
 echo
else
	echo "No existe"$OLDRUTADATAPROD$COPYDATAPROD
fi

#COPIA CONTRATOS Y IVR DESDE TMP
echo "Contratos"
ivr="/tmp/ivr*"
#du -sh  /tmp/contrato* 
#du -sh $NEWRUTA/contrato/
echo
echo "Datos IVR"
#du -sch $ivr 
#du -sh $NEWRUTA"ivr"/

echo "Datos campanias"
#rsync -av $COPYVARIOS $NEWRUTA/apps/facturas/imagenes/campanias_facturas/
du -sh $COPYVARIOS 
du -sh $NEWRUTA/apps/facturas/imagenes/campanias_facturas/


rsync -av /var/www/omega/apps/supreme/views/_images/oferta_articulos/ /Bills/omega/oferta_articulos/
rsync -av /var/www/omega/apps/supreme/views/_files/aplausos/ /Bills/omega/aplausos/
rsync -av /var/www/omega/apps/supreme/views/_images/fotos/ /Bills/omega/fotos/
rsync -av /var/www/omega/apps/supreme/views/_files/cicla/ /Bills/omega/transunion/cicla/
rsync -av /var/www/omega/apps/supreme/views/_files/padron/ /Bills/omega/transunion/padron/
rsync -av /var/www/omega/apps/supreme/views/_files/padron/archivos_xml_errores/ /Bills/omega/transunion/padron/archivos_xml_errores/
rsync -av /var/www/omega/apps/supreme/views/_files/ret_files/  /Bills/omega/ret_files/
rsync -av /var/www/omega/apps/supreme/views/_files/ret_files/old/  /Bills/omega/ret_files/old/
rsync -av /var/www/omega/apps/supreme/views/_files/ret_files/log/  /Bills/omega/ret_files/log/
rsync -av /var/www/omega/apps/supreme/views/_images/oferta_articulos  /Bills/omega/puntos/articulos
