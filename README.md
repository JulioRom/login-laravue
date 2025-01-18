# Proyecto: Login y Registro con Laravel 11 y Vue 3

## Descripción
Este proyecto implementa un sistema de login y registro utilizando **Laravel 11** como backend y **Vue 3** como frontend. 
El sistema permite a los usuarios registrarse, iniciar sesión y acceder a una página de perfil protegida.

## Tecnologías Utilizadas
- **Backend:** Laravel 11 (PHP, SQLite, Laravel Sanctum para autenticación)
- **Frontend:** Vue 3 (SPA, Vue Router, Pinia, TailwindCSS)
- **Base de Datos:** SQLite
- **Herramientas Adicionales:** Composer, NPM, Vite

---

## Instalación y Ejecución del Proyecto

### **1. Clonar el Repositorio**
```sh
    git clone https://github.com/JulioRom/login-laravue
    cd login-laravue
```

### **2. Configurar y Ejecutar el Proyecto con Script Automático**
Para facilitar la instalación, puedes ejecutar uno de los siguientes scripts según tu sistema operativo:

#### **Windows (CMD):**
```sh
setup.bat
```

#### **Linux/Mac (Bash):**
```sh
chmod +x setup.sh
./setup.sh
```

#### **Universal (Python):**
```sh
python setup.py
```

Estos scripts automatizan la instalación de dependencias, configuración de la base de datos y ejecución del backend y frontend.

---

## **Rutas del Proyecto**

### **Backend (API Laravel 11)**
| Método | Ruta | Descripción |
|---------|------|-------------|
| `POST`  | `/api/register` | Registra un usuario nuevo |
| `POST`  | `/api/login` | Inicia sesión y devuelve un token |
| `GET`   | `/api/profile` | Devuelve datos del usuario autenticado |

### **Frontend (Vue 3 - SPA)**
| Ruta | Descripción |
|------|-------------|
| `/login` | Página de inicio de sesión |
| `/register` | Página de registro |
| `/profile` | Perfil del usuario autenticado (protegida) |

---

## **Autenticación y Seguridad**
- Se usa **Laravel Sanctum** para la autenticación basada en tokens.
- **Pinia** maneja la autenticación en el frontend, guardando el token en `localStorage`.
- Se usa **Vue Router** para restringir el acceso a rutas protegidas.

---

## **Author**

- **Developed by JulioRom**
- **Contact:** [julioandrescampos@gmail.com](email to:julioandrescampos@gmail.com)
- **GitHub:** [https://github.com/JulioRom](https://github.com/JulioRom)

---

## **Mejoras Futuras**
- Implementar JWT en lugar de Laravel Sanctum.
- Agregar soporte para Google/Facebook Login.
- Implementar Tests en Laravel y Vue.

---

## **Licencia**
Este proyecto está bajo la licencia MIT.

