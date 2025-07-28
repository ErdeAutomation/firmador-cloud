# Imagen base con Java 17
FROM openjdk:17-jdk-slim

# Carpeta de trabajo dentro del contenedor
WORKDIR /app

# Copiar el archivo .jar (el firmador)
COPY svfe-api-firmador.jar .

# Copiar la carpeta temp con los certificados
COPY temp/ ./temp/

# Exponer el puerto 8080 (requisito de Clever Cloud)
EXPOSE 8080

# Ejecutar el firmador y usar el puerto que Clever Cloud le asigne automáticamente
CMD ["sh", "-c", "java -jar svfe-api-firmador.jar --server.port=${PORT:-8080}"]
