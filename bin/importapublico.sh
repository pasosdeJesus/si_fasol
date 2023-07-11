#!/bin/sh

. .env


function eval_con_eco {
  echo $@
  eval $@
}

v=$1
if (test "$v" = "-reciente") then {
	v1=`ls -lat ${MSIP_RUTA_VOLCADOS} | grep "fasol_prod-todo.*sql.gz" | head -n 1 | sed -e "s/.* fasol_prod/fasol_prod/g"`
  v2="${MSIP_RUTA_VOLCADOS}/$v1"
  echo "Volcado más reciente es $v2"
  cp $v2 /tmp/$v1
  eval_con_eco "gunzip -q /tmp/$v1"
  v3=`echo $v1 | sed -e "s/\.gz//g"`
  v="/tmp/$v3"
  echo "Tras descomprimir se usará $v"
} fi;
if (test ! -f "$v") then {
  echo "Primer parámetro ($v) debe ser -reciente o volcado por importar"
  exit 1;
} fi;

if (test $RAILS_ENV = "production") then {
  BD=$BD_PRO
  rails=bin/railsp
} else {
  BD=$BD_DES
  rails=bin/rails
} fi;

eval_con_eco "dropdb -h /var/www/var/run/postgresql -U $BD_USUARIO $BD"
eval_con_eco "createdb -h /var/www/var/run/postgresql -U $BD_USUARIO $BD"
eval_con_eco "psql -h /var/www/var/run/postgresql -U $BD_USUARIO $BD -f $v"

$rails runner -e $RAILS_ENV scripts/elimina_datos_privados.rb 
