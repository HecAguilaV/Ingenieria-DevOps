# Guía de Laboratorio: Pipeline CI/CD y Arquitectura Multinivel en AWS

## 1. Objetivo
Implementar un ciclo completo de DevOps que integre el **control de versiones distribuido**, la **automatización de construcción de imágenes** con GitHub Actions, y el **despliegue de infraestructura de red segura** en AWS siguiendo el modelo de 3 capas.

---

## 2. Fase I: Control de Versiones y Estrategia de Ramas
El desarrollo se dividirá en 3 componentes críticos. Debes crear un repositorio en GitHub y seguir la estrategia de **GitFlow**:

*   **Rama feature/frontend**: Crear un archivo `index.html` con un "Hola Mundo" básico.
*   **Rama feature/docker**: Crear un `Dockerfile` basado en la imagen oficial de `nginx:alpine` que copie el `index.html` al directorio de contenido estático del servidor.
*   **Rama feature/docs**: Crear un `README.md` detallando que se utiliza una estrategia de Ramas de Características (Feature Branches) y explicando el propósito del repositorio.

**Entregable**: Generar 3 Pull Requests (PR) independientes hacia la rama `main`.

---

## 3. Fase II: Automatización CI/CD (GitHub Actions)
Configurar la integración continua para automatizar el empaquetado de la solución:

*   **Secrets**: Configurar en el repositorio las variables `USER_DOCKERHUB` y `PASSWORD_DOCKERHUB`.
*   **Workflow**: Crear un archivo `.github/workflows/main.yml` que:
    *   Se dispare únicamente cuando se realice un **Pull Request** hacia `main`.
    *   Realice el **login, build y push** de la imagen a tu repositorio personal en Docker Hub.

---

## 4. Fase III: Infraestructura de Red en AWS (VPC)
Diseñar un entorno de red aislado y seguro que soporte una arquitectura de 3 capas:

*   **VPC**: Crear una VPC con soporte para DNS.
*   **Subredes**:
    *   1 Red Pública (Nivel Web).
    *   2 Redes Privadas (Nivel App y Nivel Datos).
*   **Seguridad (Security Groups)**:
    *   **GrupoWeb**: Permitir tráfico HTTP (80), SSH (22) e ICMP (Ping) desde cualquier origen.
    *   **GrupoApp**: Permitir tráfico HTTP, SSH e ICMP solo si el origen es el **GrupoWeb**.
    *   **GrupoDatos**: Permitir tráfico MySQL (3306) e ICMP solo si el origen es el **GrupoApp**.

---

## 5. Fase IV: Despliegue y Verificación
Instanciar los servidores y validar la comunicación:

*   **Instancias**: Crear una instancia EC2 en cada subred asociada a su respectivo Grupo de Seguridad.
*   **Validación de Conectividad**:
    *   Verificar acceso SSH a la máquina Web.
    *   Realizar ping desde la máquina Web hacia la IP privada de la máquina App para confirmar el salto entre capas.
