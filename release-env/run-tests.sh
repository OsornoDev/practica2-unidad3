#!/bin/bash

echo "Ejecutando pruebas de entorno de liberación..."

STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost)

if [ "$STATUS" -ne 200 ]; then
    echo "Pruebas fallaron. Código: $STATUS"
    exit 1
fi

echo "Pruebas del entorno PASARON."
