#!/bin/bash
# Cleanup, versione 3
#
#
#
#+
#
#+
Attenzione:
-----------
In questo script sono presenti alcune funzionalità che verranno
spiegate pi avanti.
Quando avrete ultimato la prima metà del libro,
forse non vi apparirà più così misterioso.
DIR_LOG=/var/log
ROOT_UID=0
#
LINEE=50
#
E_XCD=66
#
E_NONROOT=67
#
Solo gli utenti con $UID 0 hanno i privilegi di root.
Numero prestabilito di righe salvate.
Riesco a cambiare directory?
Codice di exit non-root.
# Da eseguire come root, naturalmente.
if [ "$UID" -ne "$ROOT_UID" ]
then
echo "Devi essere root per eseguire questo script."
exit $E_NONROOT
fi
if [ -n "$1" ]
# Verifica se è presente un’opzione da riga di comando (non-vuota).
then
linee=$1
else
linee=$LINEE # Valore preimpostato, se non specificato da riga di comando.
fi
# Stephane Chazelas suggerisce il codice seguente,
#+ come metodo migliore per la verifica degli argomenti da riga di comando,
#+ ma è ancora un po’ prematuro a questo punto del manuale.
#
#
E_ERR_ARG=65
# Argomento non numerico (formato dell’argomento non valido)
#
#
case "$1" in
#
""
) linee=50;;
#
*[!0-9]*) echo "Utilizzo: ‘basename $0‘ file-da-cancellare"; exit\
# $E_ERR_ARG;;
#
*
) linee=$1;;
#
esac
#
#* Vedere più avanti al capitolo "Cicli" per la comprensione delle righe
#+ precedenti.
5Capitolo 2. Iniziare con #!
cd $DIR_LOG
if [ ‘pwd‘ != "$DIR_LOG" ]
then
echo
exit
fi #
#+
# o
if [ "$PWD" != "$DIR_LOG" ]
# Non siamo in /var/log?
"Non riesco a cambiare in $DIR_LOG."
$E_XCD
Doppia verifica per vedere se ci troviamo nella directory corretta,
prima di cancellare il file di log.
# ancora più efficiente:
#
# cd /var/log || {
#
echo "Non riesco a spostarmi nella directory stabilita." >&2
#
exit $E_XCD;
# }
tail -$linee messages > mesg.temp # Salva l’ultima sezione del file di
# log messages.
mv mesg.temp messages
# Diventa la nuova directory di log.
# cat /dev/null > messages
#* Non più necessario, perché il metodo precedente è più sicuro.
cat /dev/null > wtmp #
echo "Log cancellati."
’: > wtmp’ e ’> wtmp’
hanno lo stesso effetto.
exit 0
# Il valore di ritorno zero da uno script
#+ indica alla shell la corretta esecuzione dello stesso.