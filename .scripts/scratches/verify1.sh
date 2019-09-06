#script che verifica se lo stesso è stato eseguito con il
#numero corretto di parametri.

E_ERR_ARGS=65
parametri_dello_script="-a -h -m -z"

#   -a = all, -h = help, ecc.

if [ $# -ne $Numero_di_argomenti_attesi ]
then
echo "Utilizzo: ‘basename $0‘ $parametri_dello_script"
exit $E_ERR_ARG
fi