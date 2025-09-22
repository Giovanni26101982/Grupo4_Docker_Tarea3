# 📌 Grupo 4
## 📌 TAREA 03: Manejo de imágenes y análisis de vulnerabilidades con github actions. 


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
- GitHub Actions  


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
1. **# actualizar**

```bash
sudo apt update && sudo apt dist-upgrade –y
```
--- 

2. **#clonar repositorio**

```bash
git clone https://github.com/TinchoXD/Grupo4_Docker_Tarea3.git
```
<img width="798" height="171" alt="01" src="https://github.com/user-attachments/assets/b3f5cfa3-6a3d-4cb6-815f-8597f1010170" />

--- 

3. **#navegar al repositorio**

```bash
cd Grupo4_Docker_Tarea3/
```
<img width="749" height="174" alt="02" src="https://github.com/user-attachments/assets/a308a775-c3ab-4218-84f7-9048b8c24109" />

--- 

4. **# Construir la imagen Local**

```bash
docker build -t fastapi-multistage:dev .
```
<img width="955" height="466" alt="03" src="https://github.com/user-attachments/assets/d3722394-7b5f-4bc7-8307-87c086cf0989" />


<img width="955" height="716" alt="04" src="https://github.com/user-attachments/assets/c3f0dfb4-4297-45a0-a0f8-8e53a4a3b75d" />


<img width="945" height="117" alt="05" src="https://github.com/user-attachments/assets/1e79bbf3-e907-4eed-8b43-42b710c42a83" />

--- 

5. **# Verificar que exista la Imagen**

```bash
docker images | grep fastapi-multistage
```

<img width="951" height="62" alt="06" src="https://github.com/user-attachments/assets/6ba26d6e-3676-41f6-a236-0f9e8b53c763" />

--- 

6. **# Crear el contenedor**

```bash
docker run -d -p 8000:8004 --name fastapi fastapi-multistage:dev
```

<img width="1370" height="60" alt="07" src="https://github.com/user-attachments/assets/8d583ca5-e3ba-4512-a89e-c73c7beaf5af" />

--- 

7. **# Verificar el Log**

```bash
docker logs -f fastapi (ctrl + c para salir)
```
<img width="921" height="115" alt="08" src="https://github.com/user-attachments/assets/fc14feb0-d1ef-4398-b47b-7bf47300fcbd" />

--- 

**Subir a Docker Hub**
--- 
8. **# iniciar sesión en docker**

```bash
docker login -u <username> (docker login -u tinchoxd)
```
--- 

9. **# ingresar contraseña o token**

```bash
El token se obtiene en la cuenta de DockerHub
Docker Hub → Account Settings → Security → New Access Token.

```
<img width="962" height="762" alt="09" src="https://github.com/user-attachments/assets/db56a73b-44cb-48d4-80f7-a0c8cc7b00ff" />


<img width="1002" height="166" alt="10" src="https://github.com/user-attachments/assets/faabc062-af62-409e-8e54-dc1413e77391" />

--- 

10. **# Etiquetar la imagen**

```bash
docker tag fastapi-multistage:dev <tu_usuario_dockerhub>/fastapi-multistage:latest

```

<img width="707" height="32" alt="11" src="https://github.com/user-attachments/assets/0ac73e08-f97b-485a-980d-0006472ce61b" />

--- 

11. **# Subir la Imagen**

<img width="1076" height="234" alt="12" src="https://github.com/user-attachments/assets/5c2fc3c6-cf95-4d08-9e2e-2fe85a190c1c" />

--- 

**Docker Scout**
---
12. **Probar Docker Scout**
   - **# Verificar que exista docker scout**
      ```bash
         docker scout version         
      ```
   - **Verificar donde se encuentran los plugins de docker**
      ```bash
         docker info | grep "Docker Root Dir"
      ```
      <img width="1103" height="48" alt="13" src="https://github.com/user-attachments/assets/703fe37d-d310-4ba9-b429-1ad6164b459f" />

   - **Si no existe crear la carpeta**
      ```bash
         mkdir -p ~/.docker/cli-plugins
      ```
      <img width="1057" height="33" alt="14" src="https://github.com/user-attachments/assets/a487d6c0-6827-4e0c-ab2e-fc3a1c44c525" />

   - **Descarga el binario de Docker Scout**
      ```bash
         curl -sSL https://github.com/docker/scout-cli/releases/latest/download/docker-scout_linux_amd64 -o ~/.docker/cli-plugins/docker-scout
      ```

   - **Otorgar permisos de Ejecución**
      ```bash
         chmod +x ~/.docker/cli-plugins/docker-scout
      ```

   - **Verificar la version de scout**

     <img width="759" height="422" alt="15" src="https://github.com/user-attachments/assets/4c6dfba9-d2d5-4a14-bdac-3c9c298da009" />

      
--- 


## ✅ Conclusiones

1. El despliegue de la aplicación `FastAPI con Docker` se realizó exitosamente mediante la construcción de una imagen multistage, permitiendo una implementación más ligera y optimizada.
   
3. El análisis con Docker Scout evidenció que, aunque la aplicación funciona correctamente, existen vulnerabilidades conocidas en librerías del sistema base y dependencias de Python.

4. Para mitigar riesgos de seguridad se recomienda:
   - Actualizar la librería starlette a la versión 0.47.2 o superior, corrigiendo fallas de recursos sin límite.
   - Mantener actualizado el sistema base y explorar imágenes oficiales más recientes o variantes “slim” para reducir la superficie de ataque.
   - Establecer un flujo de integración continua (CI/CD) que incluya escaneo automático de vulnerabilidades en cada build de imagen.
  
1. **Cumplimiento de los entregables y trazabilidad**  
   Se construyó la imagen asociada al grupo, se publicó en Docker Hub y se registraron evidencias del proceso y del análisis de vulnerabilidades en el README.md.

1. **Impacto de la estrategia de construcción (single vs multistage)**  
   El uso de `multistage` (cuando aplicó) permitió `reducir tamaño de imagen` y `disminuir la superficie de ataque`, mejorando tiempos de pull y despliegue. En escenarios simples, single puede ser suficiente, pero para producción la strategia multietapa mostró claras ventajas de seguridad y eficiencia.

1. **Integración de seguridad en el ciclo de vida (Docker Scout + CI)**  
   La automatización con `GitHub Actions` y `Docker Scout` aportó `visibilidad continua`. Esta práctica refuerza la cultura `DevSecOps` al detectar riesgos antes del despliegue.

1. **Trabajo individual con enfoque profesional**  
   La organización para la ejecución del trabajo grupal, junto con la publicación en Docker Hub y auditoría automatizada, favoreció la `responsabilidad técnica` y la `calidad del entregable`, alineando el resultado con expectativas de acuerdo a lo solicitado.

1. La actividad no solo cumplió los requerimientos, sino que consolidó un `pipeline reproducible y seguro` para empaquetar aplicaciones con Docker, `publicarlas` y `evaluar su postura de seguridad` de forma integral, dejando como valor final un repositorio verificable y un informe con evidencias claras del proceso.

3. Finalmente, la práctica demuestra la importancia de no solo asegurar la funcionalidad del contenedor, sino también su seguridad y mantenimiento continuo en entornos de producción.

---
