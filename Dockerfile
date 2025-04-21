# Imagen base
FROM python:3.10-slim

# Establecer directorio de trabajo
WORKDIR /CodingChallenge

RUN apt-get update && apt-get install -y \
    gcc \
    default-libmysqlclient-dev \
    build-essential \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Copiar archivos
COPY . .

# Instalar dependencias
RUN pip install --upgrade pip && pip install -r requirements.txt

# Exponer el puerto en el que correrá Flask
EXPOSE 5000

# Comando para correr Flask
CMD ["python", "app.py"]
