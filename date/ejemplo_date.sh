#!/usr/bin/env bash

: ${UNIX_TIMESTAMP:=`date +%s`}
echo "El Unix Timestamp es: ${UNIX_TIMESTAMP}" 

: ${YEAR:=`date +%Y`} # CON LA (Y) en mayuscula imprime 2026 (el year completo)
echo "El anio es: ${YEAR}"

: ${YEAR2:=`date +%y`} # CON LA (y) en minuscula imprime 26 (los dos ultimos digitos)
echo "El anio es: ${YEAR2}"

: ${MES:=`date +%m`}
echo "El mes es: ${MES}"

: ${DIA:= `date +%d`}
echo "El dia es: ${DIA}"

: ${HORA:= `date +%H`}
echo "La hora es: ${HORA}"

: ${MINUTOS:= `date +%M`}
echo "Los minutos son: ${MINUTOS}"

: ${FECHA_COMPLETA:= `date +%Y%m%d`}
echo "Los minutos son: ${FECHA_COMPLETA}"