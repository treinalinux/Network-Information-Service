#!/bin/bash
#
# Nome do Script:..........add_new_user
# Propósito do Script:.....Adicionar contas de usuários no Servidor NIS master e criar a homearea no Storage
# Sistema Operacional......CentOS 8
# Criado em:...............27/05/2020
# Versão do Script:........1.0
# Nome do criador:.........Alan da Silva Alves
# Contato:.................contato@treinalinux.com
# Site:....................treinalinux.com
# Nível de Privilégio:.....User Admin

clear

read -p "Informe o login do novo usuário...............: " NOME_LOGIN
read -p "Informe o grupo primário para $NOME_LOGIN............: " GRUPO_PRIMARIO
read -p "Informe o grupo secundário para $NOME_LOGIN..........: " GRUPO_SECUNDARIO
read -p "Informe o nome completo para $NOME_LOGIN.............: " NOME_REAL


useradd --no-user-group --gid "$GRUPO_PRIMARIO" --groups "$GRUPO_SECUNDARIO" --comment "$NOME_REAL" --shell /bin/bash "$NOME_LOGIN"

echo $NOME_LOGIN"1234" | passwd --stdin $NOME_LOGIN

passwd --expire $NOME_LOGIN

passwd --status $NOME_LOGIN

echo "Informar para $NOME_LOGIN que deve trocar a senha no próximo login.
Senha temporária: "
echo $NOME_LOGIN"1234"

echo "$NOME_LOGIN	-rw,hard,intr,proto=tcp,timeo=10	home.empresa.corp:/home_area/$NOME_LOGIN" >> /etc/auto.home

echo "Copie as informações para adicianar no chamado e depois atualize os mapas."

read -p "Dê ENTER para autalizar os mapas..." nada

/usr/lib64/yp/ypinit -m

ssh home.empresa.corp "sudo mkdir --parents --mode=700 --verbose teste /home_area/$NOME_LOGIN"

ssh home.empresa.corp "sudo chown --recursive --verbose $NOME_LOGIN:$GRUPO_PRIMARIO /home_area/$NOME_LOGIN"
