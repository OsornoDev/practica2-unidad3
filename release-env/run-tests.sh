#!/bin/bash

echo "Ejecutando pruebas de entorno de liberación..."

# Abrir port-forward en segundo plano (8080 -> servicio dentro del cluster)
kubectl port-forward svc/demo-app -n production 8080:80 >/dev/null 2>&1 &

# Esperar un poco a que el túnel abra
sleep 5

# Ejecutar la prueba
STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8080)

if [ "$STATUS" -eq 200 ]; then
    echo "Pruebas exitosas. Código: $STATUS"
    exit 0
else
    echo "Pruebas fallaron. Código: $STATUS"
    exit 1
fi
