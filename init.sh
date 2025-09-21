#!/bin/bash
# Uso: sh ./init.sh NOME_ARQUIVO

if [ $# -ne 1 ]; then
    echo "Uso: $0 [nome_arquivo_sem_extensão]"
    exit 1
fi

FILE="$1"

# Reinicia apenas o arquivo de entrada
: > "${FILE}.in"

echo "Arquivo '${FILE}.in' reiniciado."
