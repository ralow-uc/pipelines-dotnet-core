# Imagen base oficial de Nginx
FROM nginx:1.27

# Version de la aplicacion. La entrega el pipeline de CI al construir la imagen
ARG APP_VERSION=local
ENV APP_VERSION=${APP_VERSION}

# Entorno por defecto. El pipeline de CD lo cambia al levantar el contenedor
# (desarrollo o produccion) con -e APP_ENTORNO=...
ENV APP_ENTORNO=local

# La imagen oficial procesa /etc/nginx/templates/*.template con envsubst al arrancar
# y deja el resultado en /etc/nginx/conf.d/. Asi la misma imagen sirve para todos los entornos.
COPY default.conf.template /etc/nginx/templates/default.conf.template

# Sitio estatico de la tienda
COPY ./html /usr/share/nginx/html

EXPOSE 80
