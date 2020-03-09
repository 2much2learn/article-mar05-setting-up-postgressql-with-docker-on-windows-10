FROM postgres:11

# Custom initialization scripts
COPY bootstrap.sh /docker-entrypoint-initdb.d/bootstrap.sh
COPY pagila-schema.sql /pagila-schema.sql
COPY pagila-insert-data.sql /pagila-insert-data.sql
COPY pagila-data.sql /pagila-data.sql

RUN chmod +x /docker-entrypoint-initdb.d/bootstrap.sh && sed -i -e 's/\r$//' /docker-entrypoint-initdb.d/bootstrap.sh