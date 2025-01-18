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
    git clone https://github.com/tu-repositorio.git
    cd login-laravue
```

### **2. Configurar y Ejecutar el Backend (Laravel 11)**
```sh
    cd backend
    composer install
    cp .env.example .env
    php artisan key:generate
    php artisan migrate --seed
    php artisan serve
```
_El backend estará disponible en: `http://127.0.0.1:8000`_

### **3. Configurar y Ejecutar el Frontend (Vue 3)**
```sh
    cd ../frontend
    npm install
    npm run dev
```
_El frontend estará disponible en: `http://localhost:5173/`_

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

## Author

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

