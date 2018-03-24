#!/bin/bash

aleatorio()
{
	i=$(shuf -i 0-51 -n 1)
	return $i
}

dobraValor() {
	apostaAtual=$(( aposta + 2 ))
}

valorTotal=50
smallBind=1
bigBlind=2

aposta=2

declare -a cartas
cartas[0]="Ab"
cartas[1]="As"
cartas[2]="Ah"
cartas[3]="Ap"

cartas[4]="2b"
cartas[5]="2s"
cartas[6]="2h"
cartas[7]="2p"

cartas[8]="3b"
cartas[9]="3s"
cartas[10]="3h"
cartas[11]="3p"

cartas[12]="4b"
cartas[13]="4s"
cartas[14]="4h"
cartas[15]="4p"

cartas[16]="5b"
cartas[17]="5s"
cartas[18]="5h"
cartas[19]="5p"

cartas[20]="6b"
cartas[21]="6s"
cartas[22]="6h"
cartas[23]="6p"

cartas[24]="7b"
cartas[25]="7s"
cartas[26]="7h"
cartas[27]="7p"

cartas[28]="8b"
cartas[29]="8s"
cartas[30]="8h"
cartas[31]="8p"

cartas[32]="9b"
cartas[33]="9s"
cartas[34]="9h"
cartas[35]="9p"

cartas[36]="10b"
cartas[37]="10s"
cartas[38]="10h"
cartas[39]="10p"

cartas[40]="Jb"
cartas[41]="Js"
cartas[42]="Jh"
cartas[43]="Jp"

cartas[44]="Qb"
cartas[45]="Qs"
cartas[46]="Qh"
cartas[47]="Qp"

cartas[48]="Kb"
cartas[49]="Ks"
cartas[50]="Kh"
cartas[51]="Kp"


# FUNCAO DISTRIBUIR CARTAS
aleatorio
carta1=${cartas[$?]}
aleatorio
carta2=${cartas[$?]}

if [ "$carta1" == "$carta2" ];then
	aleatorio
	$carta2=${cartas[$?]}
fi

for b in `seq 1 5`
do
	aleatorio
	cartaMesa[$b]=${cartas[$?]}
	c=$(expr $b - 1)
	if [ "${cartaMesa[$b]}" == "$carta1" ] || [ "${cartaMesa[$b]}" == "$carta2" ] || [ "${cartaMesa[$b]}" == "${cartaMesa[$c]}" ];then
		aleatorio
		cartaMesa[$b]=${cartas[$?]}
	fi	
done

clear

echo -e "Caixa: $valorTotal\n"

echo "Suas Cartas: "
echo $carta1, $carta2

echo ""
echo "1 - Desistir   |   2 - Pagar   |   3 - Dobrar"
read n
if [ "$n" == "2" ]; then
	clear
	echo "Suas Cartas: "
	echo -e "$carta1, $carta2\n"
	sleep 1s
	echo -e "-------------------------"
	echo "Cartas na Mesa"
	printf "${cartaMesa[1]}, "
	sleep 1s 
    printf "${cartaMesa[2]}, "
    sleep 1s
    printf "${cartaMesa[3]} \n"
	echo -e "-------------------------\n"
	
	apostaAtual=$(( aposta  ))
	echo "Aposta: $apostaAtual"
	valorTotal=$(( valorTotal - aposta ))
	echo "Caixa: $valorTotal"
elif [ "$n" == "3" ]; then
	dobravalor
	
	clear
	echo "Suas Cartas: "
	echo -e "$carta1, $carta2\n"
	sleep 1s
	echo -e "-------------------------"
	echo "Cartas na Mesa"
	printf "${cartaMesa[1]}, "
	sleep 1s 
    printf "${cartaMesa[2]}, "
    sleep 1s
    printf "${cartaMesa[3]} \n"
	echo -e "-------------------------\n"
else
	exit 1
fi       

echo ""
echo "1 - Desistir   |   2 - Pagar   |   3 - Dobrar"
read n

if [ "$n" == "2" ]; then
	printf "${cartaMesa[1]}, ${cartaMesa[2]}, ${cartaMesa[3]}, "
	sleep 1s
	printf "${cartaMesa[4]} \n"

fi

echo "Deseja continuar?"
read n

if [ "$n" == "s" ]; then
	printf "${cartaMesa[1]}, ${cartaMesa[2]}, ${cartaMesa[3]}, ${cartaMesa[4]}, "
	sleep 1s
	printf "${cartaMesa[5]} \n"
	

fi

echo "fim.."
