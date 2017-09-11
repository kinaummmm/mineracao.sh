#!/bin/sh -e
#AVISO !!! ALTERAÇOES NO SCRIPT PODEM AFETAR A MINERAÇAO!
#CASO OCORRA ALGUM ERRO, ENTRE EM CONTATO COM NOSSA EQUIPE.
clear
# MINERAÇAO ??? VEM COM A CRAZY MINERS
# SKYPE CRAZYMINERS
#GRUPO SKYPE https://join.skype.com/

bash=$(echo $BASH)

versao=1.0

corPadrao="\033[0m"
verde="\033[0;32m"
vermelhoClaro="\033[1;31m"
verdeClaro="\033[1;32m"
amarelo="\033[1;33m"
branco="\033[1;37m"
purpleClaro="\033[1;35m"

wallet=$1

if [ "$1" = ""  ]
then
echo "$branco ---===-------------------------======--- \033[0m "
echo "$branco ---===       CRAZY MINERS      ======--- \033[0m "
echo "$branco ---===-------------------------======--- \033[0m "
echo ""
sleep 1
echo "$amarelo Forma de USO: \033[0m"
echo "sudo sh $0 $branco ***SuaCarteira*** \033[0m  \n "
echo "$amarelo Exemplo:\033[0m"
echo "sudo sh $0 $branco Su4Cart31R4Aqu1 \033[0m   \n"
echo "$amarelo Ajuda? entre no grupo do Skype https://join.skype.com/ \033[0m"
echo ""
exit 0
fi

echo "$vermelhoClaro ---======-------------------------======--- \033[0m "
echo "$vermelhoClaro ---======        CRAZY MINERS     ======--- \033[0m "
echo "$vermelhoClaro ---======-------------------------======--- \033[0m "
echo ""
sleep 1
echo "$amarelo Carteira a ser Enviada os Bitcoins Minerados: $branco$wallet\033[0m   "
echo ""
sleep 1

echo "$purpleClaro ---======--------------------======--- \033[0m   \n"
echo "$purpleClaro ---====== TERMOS E CONDIÇOES ======--- \033[0m   \n"
echo "$purpleClaro ---======--------------------======--- \033[0m   \n"
echo ""
sleep 2
echo "$branco  ======================================================================"
echo "$amarelo     * Duvida? grupo de Skype$branco https://join.skype.com/ "
echo "$amarelo     * Esse script funciona somente no sistema Ubuntu linux"
echo "$amarelo     * Nao venda esse script ou alugue!"
echo "$amarelo     * SE NAO CONCORDAR COM O NOSSO TERMO, FECHE O SCRIPT AGORA!"
echo "$amarelo     * Sua carteira $branco$wallet"
echo "$branco  ======================================================================"
echo ""

sleep 10

echo "$verdeClaro ---======--------------------======---    \033[0m "
echo "$verdeClaro ---====== BAIXANDO RECURSOS! ======---    \033[0m "
echo "$verdeClaro ---======--------------------======---    \033[0m "
echo ""
sleep 1
sudo apt-get install libcurl3 build-essential libcurl4-openssl-dev gcc make git nano autoconf automake screen -y > /dev/null
sudo yum -y groupinstall "Development Tools" > /dev/null
sudo yum install build-essential libcurl4-openssl-dev gcc make git nano autoconf automake screen libcurl-devel python-devel rsync -y > /dev/null
mkdir crazyminers-cpum
git clone https://github.com/kinaummmm/crazyminers.git crazyminers-cpum > /dev/null
cd crazyminers-cpum
chmod 777 *
sleep 1

echo "$amarelo ---======------------------------======---   \033[0m "
echo "$amarelo ---====== CONFIGURANDO O SCRIPT! ======---   \033[0m "
echo "$amarelo ---======------------------------======---   \033[0m "
echo ""
sleep 1
./autogen.sh
./configure CFLAGS="-O3"
make

echo "$vermelhoClaro ---======------------------------=======---     \033[0m "
echo "$vermelhoClaro ---====== INICIANDO A MINERAÇÃO! =======---     \033[0m "
echo "$vermelhoClaro ---======------------------------=======---     \033[0m "
echo ""
sleep 2

echo "$amarelo Obs: Assim que aparecer 'INICIANDO MINERAÇÃO', Aguarde 15 segundos e você ja pode fechar sua janela do terminal, que a mineração vai continuar... \033[0m"
sleep 1
echo "$branco Agora você ja pode acessa o WEBSITE http://www.zpool.ca/?address=$wallet para acompanhar sua mineração! \033[0m"
sleep 10
screen ./minerd -o stratum+tcp://yescrypt.mine.zpool.ca:6233 -u $wallet
