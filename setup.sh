#!/bin/bash

echo "🚀 Iniciando instalación del proyecto..."

# Verificar dependencias
command -v php >/dev/null 2>&1 || { echo "❌ PHP no está instalado. Instálalo antes de continuar."; exit 1; }
command -v composer >/dev/null 2>&1 || { echo "❌ Composer no está instalado. Instálalo antes de continuar."; exit 1; }
command -v node >/dev/null 2>&1 || { echo "❌ Node.js no está instalado. Instálalo antes de continuar."; exit 1; }
command -v npm >/dev/null 2>&1 || { echo "❌ npm no está instalado. Instálalo antes de continuar."; exit 1; }

echo "✅ Todas las dependencias están instaladas."

# Configurar Backend (Laravel 11)
echo "🔧 Configurando Backend (Laravel 11)..."
cd backend || exit
composer install
cp .env.example .env
php artisan key:generate
php artisan migrate --seed
nohup php artisan serve > laravel.log 2>&1 &
cd ..

# Configurar Frontend (Vue 3)
echo "🔧 Configurando Frontend (Vue 3)..."
cd frontend || exit
npm install
nohup npm run serve > vue.log 2>&1 &
cd ..

echo "✅ Instalación completada. Accede a:"
echo "🔹 Backend: http://127.0.0.1:8000"
echo "🔹 Frontend: http://localhost:8080"
