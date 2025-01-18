# Frontend: SPA con Vue 3

## Descripción
Este directorio contiene el frontend desarrollado en **Vue 3**. Se trata de una **Single Page Application (SPA)** que interactúa con la API de Laravel 11 mediante Axios y gestiona la autenticación con Pinia y Vue Router.

---

## **Requisitos Previos**
- **Node.js 16+**
- **NPM o Yarn**

---

## **Instalación y Configuración**
### 1️⃣ Instalar dependencias
```sh
cd frontend
npm install
```

### 2️⃣ Configurar variables de entorno
Asegúrate de configurar el archivo `.env` en el frontend para que la API apunte al backend:
```env
VITE_API_URL=http://127.0.0.1:8000/api
```

### 3️⃣ Iniciar el servidor de desarrollo
```sh
npm run serve
```
_El frontend estará disponible en: `http://localhost:8080/`_

---

## **Estructura del Proyecto**
```
frontend/
│── src/
│   │── views/        # Páginas principales (Login, Register, Profile)
│   │── components/   # Componentes reutilizables
│   │── router/       # Configuración de Vue Router
│   │── stores/       # Manejo de estado con Pinia
│   │── api.js        # Configuración de Axios
│── public/           # Archivos estáticos
│── index.html        # Archivo principal de la SPA
```

---

## **Rutas del Frontend**
| Ruta | Descripción |
|------|-------------|
| `/login` | Página de inicio de sesión |
| `/register` | Página de registro |
| `/profile` | Perfil del usuario autenticado (protegida) |

---

## **Manejo de Autenticación**
- Se usa **Pinia** para manejar el estado del usuario y su token.
- Se guarda el token en `localStorage` y se agrega en cada petición Axios.
- Se usa **Vue Router** para proteger rutas privadas:
```js
router.beforeEach((to, from, next) => {
  const authStore = useAuthStore();
  if (to.meta.requiresAuth && !authStore.isAuthenticated) {
    next('/login');
  } else {
    next();
  }
});
```

---

## **Author**

- **Developed by JulioRom**
- **Contact:** [julioandrescampos@gmail.com](email to:julioandrescampos@gmail.com)
- **GitHub:** [https://github.com/JulioRom](https://github.com/JulioRom)

---

## **Mejoras Futuras**
- Implementar Vuex como alternativa a Pinia.
- Agregar validaciones con VeeValidate.
- Mejorar el diseño con Tailwind CSS avanzado.

---

## **Licencia**
Este proyecto está bajo la licencia MIT.

