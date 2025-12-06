#!/bin/bash

echo "Ejecutando pruebas de entorno de liberación..."

set -e

# Esperar que los pods estén listos
echo "Esperando a que los pods estén listos..."
kubectl wait --for=condition=Ready pod -l app=demo-app -n production --timeout=60s

# Port-forward al servicio CORRECTO
echo "Abriendo tunnel (port-forward)..."
kubectl port-forward svc/demo-app-svc -n production 8080:80 >/dev/null 2>&1 &

PF_PID=$!

# Esperar a que el túnel abra
sleep 8

# Ejecutar la prueba
STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8080)

# Cerrar port-forward
kill $PF_PID

if [ "$STATUS" = "200" ]; then
    echo "Pruebas exitosas. Código: $STATUS"
    exit 0
else
    echo "Pruebas fallaron. Código: $STATUS"
    exit 1
fi
