#!/usr/bin/env bash
set -e

echo "== Iniciando pruebas =="
grep -q "Hola CI/CD con Jenkins" app/index.html
echo "Prueba OK"
