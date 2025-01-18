import os
import subprocess
import sys

def check_dependency(command, name):
    """ Verifica si una dependencia está instalada """
    if subprocess.call(f"where {command}" if os.name == "nt" else f"which {command}", shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE) != 0:
        print(f"❌ {name} no está instalado. Instálalo antes de continuar.")
        sys.exit(1)

print("🚀 Iniciando instalación del proyecto...")

# Verificar dependencias
dependencies = [("php", "PHP"), ("composer", "Composer"), ("node", "Node.js"), ("npm", "NPM")]
for cmd, name in dependencies:
    check_dependency(cmd, name)

print("✅ Todas las dependencias están instaladas.")

# Configurar Backend
print("🔧 Configurando Backend (Laravel 11)...")
os.chdir("backend")
subprocess.run("composer install", shell=True)
subprocess.run("copy .env.example .env" if os.name == "nt" else "cp .env.example .env", shell=True)
subprocess.run("php artisan key:generate", shell=True)
subprocess.run("php artisan migrate --seed", shell=True)
subprocess.Popen("php artisan serve", shell=True)
os.chdir("..")

# Configurar Frontend
print("🔧 Configurando Frontend (Vue 3)...")
os.chdir("frontend")
subprocess.run("npm install", shell=True)
subprocess.Popen("npm run dev", shell=True)
os.chdir("..")

print("✅ Instalación completada. Accede a:")
print("🔹 Backend: http://127.0.0.1:8000")
print("🔹 Frontend: http://localhost:5173")
