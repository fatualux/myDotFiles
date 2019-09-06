#! /bin/bash
#! /bin/sh

###Si scriva uno script che all’esecuzione visualizzi l’ora e la data, elenchi tutti gli utenti connessi e
###fornisca il tempo di esecuzione uptime del sistema. Lo script, quindi, dovrà salvare queste
###informazioni in un file di log.

TITLE="CK-`date +%Y%m%d`.log"

#Stampa data esecuzione controllo, uptime e salva il log in nella HOME dell'esecutore.

(printf %s "Date of check execution: " && date '+%A %d, %B %Y' && uptime) > $TITLE



