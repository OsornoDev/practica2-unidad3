# PRÁCTICA 2 – Unidad 3  
## Despliegue Automatizado en Kubernetes (Modo Fácil – k3s en GitHub Actions)

Este repositorio implementa:

- Kubernetes (k3s dentro de GitHub Actions)
- CI/CD completo
- Docker automatizado
- Pruebas unitarias y de integración
- Entorno de liberación
- Rollback automático basado en métricas
- Ingress + Namespace + ConfigMap
- 100% funcional sin instalar nada localmente

---

## Flujo CI/CD

1. GitHub Actions instala k3s (Kubernetes)
2. Construye la imagen Docker dentro del runner
3. Importa la imagen en el cluster
4. Aplica los manifiestos (deployment, service, ingress)
5. Ejecuta pruebas de liberación
6. Simula métricas
7. Si fallan → rollback automático
8. Si pasa → despliegue final

---

## Cómo ejecutarlo

Solo haz un push a `main`:

