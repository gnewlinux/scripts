#!/bin/bash
####################################
#   Monet - Monitor de Internet    #
#                                  #
#   upstream: gnew  | date: 2018   #
#   email: gnewlinux@gmail.com     #
#                                  #
#   deps: speedtest-cli            #
#   licence: GPL3+                 #
####################################

DEP=$(dpkg --get-selections | grep speedtest-cli | wc -l)
ARQUIVO="$HOME/status_conexao.csv"

function conexaoTeste(){
   echo "Aguarde estou verificando a sua conexão."
   echo "Verificando Download - Upload..."
   speedtest-cli --csv >> $ARQUIVO
}

if [ $DEP -eq 0 ]; then
   echo "Precisamos instalar a dependencia speedtest-cli..."
   sleep 2s
   sudo apt install speedtest-cli -y
fi

if [ -e $ARQUIVO ]; then
   conexaoTeste
   echo "Seu arquivo foi atualizado com sucesso: $ARQUIVO"
else
   echo "Arquivo de log não encontrado, vamos criar: $ARQUIVO"
   speedtest-cli --csv-header > $ARQUIVO
   conexaoTeste
   echo "Seu arquivo foi criado com sucesso: $ARQUIVO"
fi
