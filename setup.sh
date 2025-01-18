#!/bin/bash

set -e  # Detener el script si ocurre un error, excepto en migraciones

echo "🚀 Iniciando instalación del proyecto..."

# Función para verificar e instalar dependencias
install_dependency() {
    if ! command -v $1 &> /dev/null; then
        echo "❌ $2 no está instalado. Intentando instalar..."
        case "$1" in
            php)
                echo "🔍 Verificando disponibilidad de PHP 8.2..."
                sudo apt update && sudo apt install -y software-properties-common
                sudo add-apt-repository ppa:ondrej/php -y
                sudo apt update
                sudo apt install -y php8.2 php8.2-cli php8.2-mbstring php8.2-xml php8.2-curl php8.2-zip php8.2-sqlite3 php8.2-bcmath php8.2-tokenizer
                sudo update-alternatives --set php /usr/bin/php8.2
                ;;
            composer)
                sudo apt update && sudo apt install -y curl unzip
                curl -sS https://getcomposer.org/installer | php
                sudo mv composer.phar /usr/local/bin/composer
                ;;
            node)
                echo "🔍 Verificando versión de Node.js..."
                NODE_VERSION=$(node -v 2>/dev/null | cut -d. -f1 | tr -d 'v')
                if [[ -z "$NODE_VERSION" || "$NODE_VERSION" -lt 12 ]]; then
                    echo "⚠️ Versión de Node.js incompatible ($NODE_VERSION). Instalando Node.js 18..."
                    sudo apt update && sudo apt install -y curl
                    curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
                    sudo apt install -y nodejs
                    hash -r  # Refrescar comandos
                fi
                ;;
            npm)
                sudo apt update && sudo apt install -y npm
                ;;
            *)
                echo "⚠️ No se pudo instalar $2 automáticamente. Instálalo manualmente y vuelve a ejecutar el script."
                exit 1
                ;;
        esac
    else
        echo "✅ $2 está instalado."
    fi
}

# Verificar e instalar dependencias
install_dependency php "PHP"
install_dependency composer "Composer"
install_dependency node "Node.js"
install_dependency npm "NPM"

# Verificar la versión de PHP y actualizar si es necesario
required_php_version="8.2"
current_php_version=$(php -r "echo PHP_VERSION;" | cut -d. -f1,2)
if [[ "$current_php_version" != "$required_php_version" ]]; then
    echo "⚠️ Versión de PHP incompatible ($current_php_version). Actualizando a PHP $required_php_version..."
    sudo apt install -y php$required_php_version php$required_php_version-cli php$required_php_version-mbstring php$required_php_version-xml php$required_php_version-curl php$required_php_version-zip php$required_php_version-sqlite3 php$required_php_version-bcmath php$required_php_version-tokenizer
    sudo update-alternatives --set php /usr/bin/php$required_php_version
fi

# Verificar versión final de Node.js
echo "✅ Versión de Node.js instalada: $(node -v)"

echo "✅ Todas las dependencias están instaladas."

# Configurar Backend (Laravel 11)
echo "🔧 Configurando Backend (Laravel 11)..."
if [ -d "backend" ]; then
    cd backend || exit
    composer install
    cp .env.example .env
    php artisan key:generate
    
    # Manejo de errores en migraciones
    echo "🔄 Ejecutando migraciones..."
    if ! php artisan migrate --seed; then
        echo "⚠️ Error en 'php artisan migrate --seed'. Intentando continuar..."
    fi
    
    # Iniciar Laravel en una nueva pestaña de terminal
    gnome-terminal --tab --title="Backend" -- bash -c "cd $(pwd) && php artisan serve; exec bash"
    cd ..
else
    echo "⚠️ La carpeta 'backend' no existe. Verifica la estructura del proyecto."
fi

# Configurar Frontend (Vue 3)
echo "🔧 Configurando Frontend (Vue 3)..."
if [ -d "frontend" ]; then
    cd frontend || exit
    npm install
    
    # Iniciar Vue en una nueva pestaña de terminal
    gnome-terminal --tab --title="Frontend" -- bash -c "cd $(pwd) && npm run serve; exec bash"
    cd ..
else
    echo "⚠️ La carpeta 'frontend' no existe. Verifica la estructura del proyecto."
fi

echo "✅ Instalación completada. Accede a:"
echo "🔹 Backend: http://127.0.0.1:8000"
echo "🔹 Frontend: http://localhost:8080"
