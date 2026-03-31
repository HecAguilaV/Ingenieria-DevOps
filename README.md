# AWS Multinivel: Pipeline CI/CD y Arquitectura 3-Tier

Repositorio para la implementación de un ciclo DevOps completo que integra control de versiones, automatización de imágenes (Docker + GitHub Actions) y desplegué de infraestructura segura en AWS.

## 🎯 Objetivo General
Implementar una arquitectura de red multinivel (3 capas) segura en AWS, automatizando el empaquetado del software y su distribución mediante un pipeline de CI/CD.

## 🛠️ Estrategia de Ramas (GitFlow)
Este proyecto sigue una estrategia de **Ramas de Características (Feature Branches)** para garantizar la estabilidad de la rama principal:

- `main`: Rama de producción (solo código verificado).
- `develop`: Rama de integración (donde se fusionan los features).
- `feature/frontend`: Implementación de la capa de interfaz de usuario.
- `feature/docker`: Configuración de la persistencia de imágenes y contenedorización.
- `feature/docs`: Documentación detallada del proyecto.

## 🏗️ Arquitectura en AWS (Diseño 3-Tier)
La infraestructura se despliega en una **VPC** con la siguiente jerarquía de red:

1. **Capa Web (Pública)**: Instancias con acceso directo HTTP/HTTPS.
2. **Capa App (Privada)**: Lógica de negocio (accesible solo desde la capa Web).
3. **Capa Datos (Privada)**: Bases de datos (accesible solo desde la capa App).

---
*Este proyecto es parte de un laboratorio práctico de Ingeniería DevOps.*
