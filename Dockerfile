FROM n8nio/n8n:latest

ARG PGPASSWORD
ARG PGHOST
ARG PGPORT
ARG PGDATABASE
ARG PGUSER

ENV DB_TYPE=postgresdb
ENV DB_POSTGRESDB_DATABASE=$PGDATABASE
ENV DB_POSTGRESDB_HOST=$PGHOST
ENV DB_POSTGRESDB_PORT=$PGPORT
ENV DB_POSTGRESDB_USER=$PGUSER
ENV DB_POSTGRESDB_PASSWORD=$PGPASSWORD
ENV N8N_USER_FOLDER=$RAILWAY_VOLUME_MOUNT_PATH

# Create the '.n8n' directory with the necessary permissions
RUN mkdir -p /root/.n8n && chown -R node:node /root/.n8n

CMD ["n8n", "start"]
