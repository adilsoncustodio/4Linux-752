#!/bin/bash

for NOME in $(getent passwd | awk -F:  '$3 >= 1000 {print $1 }' | egrep -v "nobody|vagrant|suporte")
do
	echo $NOME CRIANDO O DIRETORIO
	maildirmake /home/${NOME}/Maildir/
	maildirmake /home/${NOME}/Maildir/.Enviados
	maildirmake /home/${NOME}/Maildir/.Rascunho
	maildirmake /home/${NOME}/Maildir/.Lixeira
	maildirmake /home/${NOME}/Maildir/.SPAM
	echo $NOME ALTERANDO O DONO
	chown ${NOME}: /home/${NOME} -R
done
