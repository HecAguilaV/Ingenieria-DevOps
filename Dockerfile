# Usamos una imagen ligera de Nginx basada en Alpine Linux
FROM nginx:alpine

# Copiamos nuestro index.html al directorio por defecto de Nginx
COPY index.html /usr/share/nginx/html/index.html

# Exponemos el puerto 80
EXPOSE 80

# Iniciamos Nginx
CMD ["nginx", "-g", "daemon off;"]
