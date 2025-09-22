# 📌 Grupo 4
## 📌 TAREA 03: Despliegue MySQL 9.0 + phpMyAdmin 5.2.1 en Docker 


---

## 🚀 Integrantes
| Nro. | Nombre | Link |
|------|---------|---------|
| 1 | Giovanni Xavier Baño Jaya | https://github.com/Giovanni26101982/Grupo4_Docker_Tarea1 |
| 2 | Portero Salas Onofre Lolislao | https://github.com/oportero/Grupo4_Docker_Tarea1 |
| 3 | Jara Pauta Cesar Paúl |  https://github.com/PaulJara84/Grupo4_Docker_Tarea1  |
| 4 | Maldonado Flores Oscar Alexander | https://github.com/Oscar112248/Docker |
| 5 | Balarezo Leon Ricardo Martin | https://github.com/TinchoXD/Grupo4_Docker_Tarea1 |

---

## 📖 Introducción

El despliegue de servicios en contenedores permite crear entornos ligeros, portables y fáciles de administrar.  
En este proyecto se implementa una infraestructura básica compuesta por **MySQL** como motor de base de datos y **phpMyAdmin** como herramienta de gestión web, utilizando **Docker**.  

La solución aprovecha:
- **Contenedores** para ejecutar cada servicio de forma aislada.  
- **Redes** para permitir la comunicación segura entre los servicios sin exponer puertos innecesarios.  
- **Volúmenes** para garantizar la persistencia de los datos, incluso si los contenedores son eliminados o reiniciados.  

Este enfoque facilita el desarrollo, las pruebas y el despliegue, al mismo tiempo que reduce los problemas de configuración y compatibilidad entre entornos.  

---

## 🚀 Características
- MySQL 9.0  
- phpMyAdmin 5.2.1

---  

## 📂 Estructura
```bash
├── .env/          
├── comandos.txt/         # Código fuente
├── mysql-init
├   └── init.sql              # Base de datos
└── README.md

```
--- 

## 🛠 Desarrollo - Procedimiento

--- 
1. **Clonar el repositorio en el directorio**

<img width="827" height="198" alt="01" src="https://github.com/user-attachments/assets/7982315d-5d0b-411c-bacd-7ce12303d66c" />

--- 

2. **Navegar al directorio /Docker y listar los archivos**

```bash
ls -l
```
<img width="828" height="198" alt="02" src="https://github.com/user-attachments/assets/bc339bec-c4a2-422f-bc06-441a6352f296" />

--- 

3. **Tree ->**

<img width="289" height="157" alt="03" src="https://github.com/user-attachments/assets/a3d4c6b3-9700-48f6-9da5-b1982b014fbd" />

--- 

4. **Crear la Red**
```bash
docker network create mysql-network
   ```
   <img width="826" height="51" alt="04" src="https://github.com/user-attachments/assets/1e68d637-235d-4aa2-8051-05b52be45349" />

--- 

5. **Crear un Volumen**
 ```bash
   docker volume create mysql-volume
   ```
   <img width="829" height="53" alt="05" src="https://github.com/user-attachments/assets/b43e6e46-eb3f-4402-a0e2-daa402116cb1" />

--- 

6. **Crear contenedor de MySQL (con versión 9.0)**
 ```bash
 docker run -d \
 --name mysql-container \
 --network mysql-network \
 --env-file .env \
 -v $(pwd)/mysql-volumen:/var/lib/mysql \
 -v $(pwd)/mysql-init:/docker-entrypoint-initdb.d \
 mysql:9.0

   ```
<img width="840" height="487" alt="06" src="https://github.com/user-attachments/assets/cc5a53d2-3487-492f-ba5e-9552f81b1d3c" />

--- 

7. **Crear contenedor de phpMyAdmin**
 ```bash
 docker run -d \
 --name phpmyadmin-container \
 --network mysql-network \
 --env-file .env \
 -p 8080:80 \
 phpmyadmin:5.2.1
   ```
<img width="829" height="657" alt="07" src="https://github.com/user-attachments/assets/3e5297e4-c448-4b5c-8538-1c321cfebddd" />

--- 

8. **Verificar los contenedores creados**
 ```bash
 docker ps -a
   ```
<img width="1070" height="71" alt="08" src="https://github.com/user-attachments/assets/31d91463-2103-4dfb-b06d-411682f542be" />

--- 

9. **Abrir un navegador en el host y abrir la dirección http://localhost:8080/**
 ```bash
 [docker ps -a](http://localhost:8080/)
   ```
<img width="1071" height="572" alt="09" src="https://github.com/user-attachments/assets/ac560485-1868-4bed-957b-f975eb21dfc9" />

--- 

10. **Abrir un navegador en el host y abrir la dirección http://localhost:8080/**

<img width="1071" height="572" alt="09" src="https://github.com/user-attachments/assets/ac560485-1868-4bed-957b-f975eb21dfc9" />

--- 

11. **Usar las credenciales del .env**

   - MYSQL_USER=adminmdmq
   - MYSQL_PASSWORD=Emmeth2906@

<img width="1069" height="409" alt="11" src="https://github.com/user-attachments/assets/4ad24c70-8b7e-4db6-af4c-747be9bf53a5" />

--- 


## ✅ Conclusiones

1. **Facilidad de despliegue**  
   Docker permite levantar un entorno con MySQL 9.0 y PhpMyAdmin en pocos comandos, sin necesidad de configuraciones manuales extensas.  

2. **Portabilidad**  
   El proyecto puede ejecutarse en cualquier máquina con Docker, garantizando que las versiones de MySQL y PhpMyAdmin sean consistentes entre distintos entornos (desarrollo, pruebas, producción).  

3. **Aislamiento**  
   La base de datos y la herramienta de administración corren en contenedores independientes, evitando conflictos con instalaciones locales.  

4. **Escalabilidad**  
   La configuración con `docker-compose` permite agregar fácilmente nuevos servicios (como un backend o balanceador) sin alterar la base de datos ya levantada.  

5. **Mantenimiento reducido**  
   Las actualizaciones de MySQL o PhpMyAdmin se realizan simplemente cambiando la imagen en el `docker-compose.yml`, simplificando el mantenimiento a largo plazo.  

6. **Acceso simplificado**  
   PhpMyAdmin brinda una interfaz gráfica accesible desde el navegador, lo que facilita la gestión de la base de datos para usuarios no familiarizados con la línea de comandos.  

7. **Persistencia de datos**  
   Con volúmenes de Docker, los datos se conservan incluso si los contenedores se reinician o eliminan, asegurando confiabilidad.  


---
