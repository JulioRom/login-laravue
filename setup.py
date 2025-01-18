import os
import subprocess
import sys

def check_dependency(command, name):
    """ Verifica si una dependencia está instalada """
    result = subprocess.run(command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    if result.returncode != 0:
        print(f"❌ {name} no está instalado. Instálalo antes de continuar.")
        sys.exit(1)

print("🚀 Iniciando instalación del proyecto...")

# Verificar dependencias
dependencies = [
    ("php -v", "PHP"),
    ("composer --version", "Composer"),
    ("node -v", "Node.js"),
    ("npm -v", "NPM")
]

for cmd, name in dependencies:
    check_dependency(cmd, name)

print("✅ Todas las dependencias están instaladas.")

# Configurar Backend (Laravel 11)
print("🔧 Configurando Backend (Laravel 11)...")
os.chdir("backend")

subprocess.run("composer install", shell=True, check=True)

# Crear la base de datos si no existe
db_path = "database/database.sqlite"
if not os.path.exists(db_path):
    open(db_path, "w").close()
    print("✅ Base de datos SQLite creada.")

subprocess.run("copy .env.example .env" if os.name == "nt" else "cp .env.example .env", shell=True, check=True)
subprocess.run("php artisan key:generate", shell=True, check=True)

# Manejar errores en migraciones
try:
    subprocess.run("php artisan migrate --seed", shell=True, check=True)
except subprocess.CalledProcessError as e:
    print(f"⚠️ Error en `php artisan migrate --seed`: {e}")
    print("⚠️ Intentando `php artisan db:wipe` y reintentando migraciones...")
    try:
        subprocess.run("php artisan db:wipe", shell=True, check=True)
        subprocess.run("php artisan migrate --seed", shell=True, check=True)
    except subprocess.CalledProcessError as e:
        print(f"❌ Las migraciones siguen fallando: {e}")
        print("⚠️ Verifica manualmente el problema en `backend/database/database.sqlite`.")

# Iniciar el servidor de Laravel en segundo plano
subprocess.Popen("php artisan serve", shell=True)

os.chdir("..")

# Configurar Frontend (Vue 3)
print("🔧 Configurando Frontend (Vue 3)...")
os.chdir("frontend")
subprocess.run("npm install", shell=True, check=True)

# Iniciar el servidor de Vue en segundo plano
subprocess.Popen("npm run serve", shell=True)

os.chdir("..")

print("✅ Instalación completada. Accede a:")
print("🔹 Backend: http://127.0.0.1:8000")
print("🔹 Frontend: http://localhost:8080")
