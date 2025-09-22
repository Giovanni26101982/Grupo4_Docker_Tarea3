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

En la presente tarea se documenta el desarrollo y entrega del laboratorio grupal fastapi-app, cuyo objetivo es construir, publicar y evaluar la seguridad de una imagen Dockerfile multistage, y automatizar el análisis de vulnerabilidades mediante GitHub Actions con Docker Scout.

El trabajo contempla: 

- Con base en el laboratorio de fastapi-app, deberan subir la imagen que le corresponde a su grupo y las aplicaciones a su repositorio de github 
- Construir la imagen, subir a docker hub y realizar el análisis de vulnerabilidades con docker scout mediante un flujo de github actions
- Realizar el reporte de lo ejecutado en el archivo Readme.md del repositorio. Dentro del reporte debe constar la captura de pantalla que muestre la subida de la imagen en su repositorio de Docker hub y los resultados del análisis de vulnerabilidades con docker scout.
- Este trabajo se lo realizó de manera grupal y se encuentra publicado eb el repositorio git.

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

1. **Cumplimiento de los entregables y trazabilidad**  
   Se construyó la imagen asociada al grupo, se publicó en Docker Hub y se registraron evidencias del proceso y del análisis de vulnerabilidades en el README.md.

1. **Impacto de la estrategia de construcción (single vs multistage)**  
   El uso de `multistage` (cuando aplicó) permitió `reducir tamaño de imagen` y `disminuir la superficie de ataque`, mejorando tiempos de pull y despliegue. En escenarios simples, single puede ser suficiente, pero para producción la strategia multietapa mostró claras ventajas de seguridad y eficiencia.

1. **Integración de seguridad en el ciclo de vida (Docker Scout + CI)**  
   La automatización con `GitHub Actions` y `Docker Scout` aportó `visibilidad continua`. Esta práctica refuerza la cultura `DevSecOps` al detectar riesgos antes del despliegue.

1. **Trabajo individual con enfoque profesional**  
   La organización para la ejecución del trabajo grupal, junto con la publicación en Docker Hub y auditoría automatizada, favoreció la `responsabilidad técnica` y la `calidad del entregable`, alineando el resultado con expectativas de acuerdo a lo solicitado.

1. La actividad no solo cumplió los requerimientos, sino que consolidó un `pipeline reproducible y seguro` para empaquetar aplicaciones con Docker, `publicarlas` y `evaluar su postura de seguridad` de forma integral, dejando como valor final un repositorio verificable y un informe con evidencias claras del proceso.

   

---
