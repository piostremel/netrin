#!/bin/bash

#script copiado para dentro de cada POD na inicialização, com o objetivo de prover backup

#pasta para demonstração do funcionamento
BACKUP_DIR="/data/db/backup"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
BACKUP_FILE="${BACKUP_DIR}/mongodb_backup_${TIMESTAMP}"

echo "Iniciando backup do MongoDB para ${BACKUP_FILE}..."

# Certifique-se de que o diretório de backup existe
mkdir -p "$BACKUP_DIR"

# Executa o mongodump
mongodump --out "$BACKUP_FILE" --username admin --password password --authenticationDatabase admin

if [ $? -eq 0 ]; then
  echo "Backup concluído com sucesso em ${BACKUP_FILE}"
else
  echo "Erro durante o backup do MongoDB."
fi
