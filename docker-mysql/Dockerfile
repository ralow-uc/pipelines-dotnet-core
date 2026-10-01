# Base de datos de la tienda sobre la imagen oficial de MySQL
FROM mysql:8.0

# Las contrasenas NO van en la imagen. La guia las deja en ENV y cualquiera que haga
# docker pull las ve con docker inspect. Aca llegan al levantar el contenedor.
COPY init.sql /docker-entrypoint-initdb.d/init.sql

# La VM B1s tiene 1 GiB de RAM y comparte el espacio con el sitio y el agente de Azure Pipelines,
# asi que se achica el buffer de InnoDB y se apaga performance_schema.
CMD ["mysqld", "--innodb-buffer-pool-size=64M", "--performance-schema=OFF", "--max-connections=50"]

EXPOSE 3306
