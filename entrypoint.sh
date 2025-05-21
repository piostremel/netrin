#!/bin/bash
set -e

# Inicia o MongoDB em segundo plano
mongod --bind_ip_all &

# Espera o MongoDB iniciar e aceitar conexões
# MongoDB 4< o comando é 'mongo'
until mongosh --eval 'print("waited for connection")'; do
  sleep 1
done

echo "MongoDB iniciado e pronto para conexões."

# Mantém o contêiner em execução
tail -f /dev/null

# Versão mais simples do entrypoint, para ser mais íntegro seria melhor testar a conexão com o PID do processo.
# Este arquivo fica na pasta do deployment. Durante o deployment, é copiado para /usr/local/bin e daí é copiado para
# cada POD criado.
#Tem por objetivo testar o mongo.
