#!/bin/bash

echo "Criando Diretórios..."
mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo "Criando Grupos de Usuários..."
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando Usuários e Determinando Seus Respectivos Grupos..."
useradd brenda -c "Brenda Cooley"  -m -s /bin/bash -p $(openssl passwd -6 senha123) -G GRP_ADM
useradd seth -c "Seth Woodward"  -m -s /bin/bash -p $(openssl passwd -6 senha123) -G GRP_ADM
useradd laura -c "Laura Baker"  -m -s /bin/bash -p $(openssl passwd -6 senha123) -G GRP_ADM

useradd john -c "John Galloway" -m -s /bin/bash -p $(openssl passwd -6 senha123) -G GRP_VEN
useradd robert -c "Robert Wilson" -m -s /bin/bash -p $(openssl passwd -6 senha123) -G GRP_VEN
useradd sarah -c "Sarah Thomas" -m -s /bin/bash -p $(openssl passwd -6 senha123) -G GRP_VEN

useradd kayla -c "Kayla Williams" -m -s /bin/bash -p $(openssl passwd -6 senha123) -G GRP_SEC
useradd kevin -c "Kevin Thomas" -m -s /bin/bash -p $(openssl passwd -6 senha123) -G GRP_SEC
useradd gary -c "Gary Matthews" -m -s /bin/bash -p $(openssl passwd -6 senha123) -G GRP_SEC

#Ao entrar no server, os usuários precisam criar suas própias senhas ao invés de usarem a padronizada
USERS="brenda seth laura"
for user in $USERS
do
  #Define a expiração da senha para o próximo login
  chage -d 0 $user
done

echo "Especificando Permissões..."
#Determina dono e grupo dos diretórios
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

#Determina permissões de dono, grupo e outros sobre os diretórios
chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "Finalizado!"
