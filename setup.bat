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
pushd backend
composer install
copy .env.example .env
php artisan key:generate
php artisan migrate --seed
start /B php artisan serve
popd

:: Configurar Frontend (Vue 3)
echo 🔧 Configurando Frontend (Vue 3)...
pushd frontend
npm install
start /B npm run dev
popd

echo ✅ Instalación completada. Accede a:
echo 🔹 Backend: http://127.0.0.1:8000
echo 🔹 Frontend: http://localhost:5173
pause
