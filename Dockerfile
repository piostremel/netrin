#Arquivo com o objetivo de definir os scripts iniciais que compõem a imagem
#dos pods, quando criados 

# Usa uma imagem base oficial do MongoDB
FROM mongo:6.0

# Define variáveis de ambiente para o MongoDB (opcional, mas bom para consistência)
ENV MONGO_INITDB_ROOT_USERNAME=admin
ENV MONGO_INITDB_ROOT_PASSWORD=password

# Copia o script de entrypoint personalizado
# COPY entrypoint.sh /usr/local/bin/entrypoint.sh
# RUN chmod +x /usr/local/bin/entrypoint.sh

# Copia o script de backup
# COPY backup_script.sh /usr/local/bin/backup_script.sh
# RUN chmod +x /usr/local/bin/backup_script.sh

# Define o diretório de trabalho
WORKDIR /data/db

# Expõe a porta padrão do MongoDB
EXPOSE 27017

# Define o entrypoint.sh para iniciar o MongoDB e o script de backup
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
