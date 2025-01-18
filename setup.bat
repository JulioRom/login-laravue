@echo off
echo 🚀 Iniciando instalación del proyecto...

:: Verificar dependencias
where php >nul 2>nul || (echo ❌ PHP no está instalado. Instálalo antes de continuar. & exit /b)
where composer >nul 2>nul || (echo ❌ Composer no está instalado. Instálalo antes de continuar. & exit /b)
where node >nul 2>nul || (echo ❌ Node.js no está instalado. Instálalo antes de continuar. & exit /b)
where npm >nul 2>nul || (echo ❌ npm no está instalado. Instálalo antes de continuar. & exit /b)

echo ✅ Todas las dependencias están instaladas.

:: Configurar Backend (Laravel 11)
echo 🔧 Configurando Backend (Laravel 11)...
cd backend
call composer install
call copy .env.example .env
call php artisan key:generate
call php artisan migrate --seed
start "Laravel Server" cmd /k "php artisan serve"
cd ..

:: Configurar Frontend (Vue 3)
echo 🔧 Configurando Frontend (Vue 3)...
cd frontend
call npm install
start "Vue Server" cmd /k "npm run serve"
cd ..

echo ✅ Instalación completada. Accede a:
echo 🔹 Backend: http://127.0.0.1:8000
echo 🔹 Frontend: http://localhost:8080
pause
