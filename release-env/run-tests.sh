#!/bin/bash

echo "Ejecutando pruebas de entorno de liberación..."

set -e

# Esperar a que el pod esté realmente corriendo
echo "Esperando a que el pod esté listo..."
kubectl wait --for=condition=Ready pod -l app=demo-app -n production --timeout=60s

# Abrir port-forward en background
echo "Abriendo tunnel (port-forward)..."
kubectl port-forward svc/demo-app -n production 8080:80 >/dev/null 2>&1 &

# Guardar PID del port-forward
PF_PID=$!

# Esperar a que realmente abra (fundamental)
sleep 8

# Probar endpoint
STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8080)

# Detener port-forward
kill $PF_PID

if [ "$STATUS" = "200" ]; then
    echo "Pruebas exitosas. Código: $STATUS"
    exit 0
else
    echo "Pruebas fallaron. Código: $STATUS"
    exit 1
fi
