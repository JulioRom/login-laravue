# Backend: API en Laravel 11

## Descripción
Este directorio contiene la API backend desarrollada en **Laravel 11**. Proporciona los servicios para el login, registro y perfil de usuario mediante **Laravel Sanctum** para la autenticación.

---

## **Requisitos Previos**
- **PHP 8.1 o superior**
- **Composer**
- **SQLite** (o cualquier base de datos compatible con Laravel)

---

## **Instalación y Configuración**
### 1️⃣ Instalar dependencias
```sh
cd backend
composer install
```

### 2️⃣ Configurar variables de entorno
```sh
cp .env.example .env
php artisan key:generate
```
Asegúrate de configurar la base de datos en el archivo `.env`:
```env
DB_CONNECTION=sqlite
DB_DATABASE=database/database.sqlite
```

### 3️⃣ Ejecutar migraciones
```sh
php artisan migrate --seed
```

### 4️⃣ Iniciar el servidor de desarrollo
```sh
php artisan serve
```
_El backend estará disponible en: `http://127.0.0.1:8000`_

---

## **Rutas del Backend (API)**
| Método | Ruta | Descripción |
|---------|------|-------------|
| `POST`  | `/api/register` | Registra un usuario nuevo |
| `POST`  | `/api/login` | Inicia sesión y devuelve un token |
| `GET`   | `/api/profile` | Devuelve datos del usuario autenticado |

---

## **Autenticación con Laravel Sanctum**
- Se utiliza **Laravel Sanctum** para manejar la autenticación basada en tokens.
- Es necesario incluir el token en el header `Authorization` al hacer peticiones protegidas:
```sh
Authorization: Bearer {tu_token}
```

---

## **Pruebas con Postman**
Puedes probar la API usando Postman o `cURL`:
```sh
curl -X POST http://127.0.0.1:8000/api/login -H "Content-Type: application/json" -d '{"email":"test@example.com", "password":"123456"}'
```

---

## Author

- **Developed by JulioRom**
- **Contact:** [julioandrescampos@gmail.com](email to:julioandrescampos@gmail.com)
- **GitHub:** [https://github.com/JulioRom](https://github.com/JulioRom)

---

## **Mejoras Futuras**
- Agregar validaciones más robustas en los formularios.
- Implementar refresh tokens para mejorar seguridad.
- Agregar pruebas unitarias con PHPUnit.

---

## **Licencia**
Este proyecto está bajo la licencia MIT.
