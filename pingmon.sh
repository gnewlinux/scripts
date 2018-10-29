#!/bin/bash

################################################################################
################################## PINGMON ###################################
#Pingmon é um monitor de rede que colege o tempo de resposta do ping e traduz
#num gráfico para melhor visualizacao
#
#Autor: Tulio Amancio (tsuriu)
#data: Finalizado em 02062013
################################################################################

INICIO=$(date)
echo "######O TESTE FOI INICIADO EM:########" >> ip_log
echo "     $INICIO" >> ip_log
echo "######################################" >> ip_log
echo "   " >> ip_log
echo "   " >> ip_log 

touch ping_out
touch ip_dat.dat
touch ip_graph.gnu
touch ip_log
touch log_temp

#O parametro ip receb o alvo(ip, url ou nome), e o npk recebe o números de pacotes a serem enviados.
echo "Insira o ip alvo e o nº de pacotes a serem enviados, na mesma lina separados apenas por um espaço."
echo "Obs.: Os pacotes serão enviados com um intervalo de 5 segundos."
read ip npk;

#TIMEOUT: É o tempo de resposta do ping
ping -i .5 -c $npk $ip | tee ping_out
cat ping_out | tail -n 2 > log_temp


TIMEOUT=$(cat ping_out|sed -n "/:/p"|sed "s/=/-/g"|sed "s/ /-/g"|cut -d":" -f2|cut -d"-" -f3,7|sed "s/-/ /g")

TIME_MIN=$(cat ping_out|tail -n 2|sed -n "/rtt/p"|cut -d"=" -f2|cut -d"/" -f1) #Menor tempo de resposta.

TIME_MAX=$(cat ping_out|tail -n 2|sed -n "/rtt/p"|cut -d"=" -f2|cut -d"/" -f3) #Maior tempo de resposta.

TIME_MED=$(cat ping_out|tail -n 2|sed -n "/rtt/p"|cut -d"=" -f2|cut -d"/" -f4|cut -d" " -f1) #Media de todos TIMEOUT.

TIME_T=$(cat ping_out|tail -n 2|sed -n "/,/p"|cut -d"," -f4|cut -d" " -f3) #Tempo total. Soma de todos os TIMEOUT.

LOSS_PK_PECENT=$(cat ping_out|tail -n 2|sed -n "/,/p"|cut -d"," -f3|cut -d" " -f2) #Porcentagem de pacotes perdidos.

TRANS_PK=$(cat ping_out|tail -n 2|sed -n "/,/p"|cut -d"," -f1|cut -d" " -f1) #Pacotes transmitidos.

RECE_PK=$(cat ping_out|tail -n 2|sed -n "/,/p"|cut -d"," -f2|cut -d" " -f2) #Pacotes recebidos.

#Geração do arquivo de log
echo "O MENOR TEMPO DE RESPOSTA FOI $TIME_MIN ms" >> ip_log
echo "O MAIOR TEMPO DE RESPOSTA FOI $TIME_MAX ms" >> ip_log
echo "A MÉDIA DO TIMEOUT FOI $TIME_MED ms" >> ip_log
echo "FORAM PERDIDOS $LOSS_PK_PECENT DOS PACOTES" >> ip_log
echo "FORAM TRANSMITIDOS $TRANS_PK E RECEBIDOS $RECE_PK PACOTES" >> ip_log

FIM=$(date)
echo "   " >> ip_log
echo "   " >> ip_log
echo "######O TESTE FOI CONCLUIDO EM:########" >> ip_log
echo "     $FIM" >> ip_log
echo "######################################" >> ip_log


#Geração do arquivo de dados
echo "$TIMEOUT" > ip_dat.dat

################################################################################
#Plotagem dos dados com gnuplot

echo "set terminal png" >> ip_graph.gnu
echo "set output 'ip_graph.png'" >> ip_graph.gnu

echo "set title 'Timeout  vs. Number_of_received_packages' " >> ip_graph.gnu
echo "set xrange [1:'$RECE_PK']" >> ip_graph.gnu
echo "set xlabel 'NORP'" >> ip_graph.gnu
echo "set ylabel 'Timeout (mili-seconds)'" >> ip_graph.gnu

echo "plot '"ip_dat.dat"' with lines" >> ip_graph.gnu

/usr/bin/gnuplot ip_graph.gnu
###############################################################################

#############################################################################
#Exibe o grafico numa imagem .png

display "ip_graph.png" &
#############################################################################

rm ping_out
rm log_temp
rm ip_graph.gnu
