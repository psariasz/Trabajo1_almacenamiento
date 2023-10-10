# Trabajo #1
El presente trabajo consta en el diseño e implementación de un ecosistema de almacenamiento y procesamiento de datos relacionados con el cambio climatico en Colombia.
Para esto se tomaron los [datos hidrometeorológicos crudos – Red de Estaciones IDEAM: Temperatura](https://www.datos.gov.co/Ambiente-y-Desarrollo-Sostenible/Datos-Hidrometeorol-gicos-Crudos-Red-de-Estaciones/sbwg-7ju4)

Para lectura completa del trabajo, y de la implementación de un datalake y procesamiento con el uso de herramientas en AWS, puyede referirse al siguiente documento: [Trabajo 1](https://github.com/psariasz/Trabajo1_almacenamiento/blob/main/Trabajo_1.pdf)

| Nombre del Miembro | Correo electronico | 
|-------------|-------------|
|  Pablo Simón Arias Zuluaga: Cientifico de Datos | psariasz@eafit.edu.co|
|  Sebastian Giraldo Gomez: Cientifico de Datos | sgiraldog7@eafit.edu.co|

## Requerimientos
Para el proceso de ingesta de los archivos al S3:

1. instalar dentro de cada maquina AWS CLIENT:
```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```
y luego de esto configurar las variables, que se encuentran en el archivo .conf

```
aws configure
aws configure set aws_session_token INSERTAR_TOKEN
```
Recuerde hacer ejecutable el archivo src/load.sh

```
chmod +x src/load.sh
./src/load.sh
```
