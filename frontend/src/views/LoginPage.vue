<template>
  <div class="min-h-screen flex items-center justify-center">
    <div class="bg-white p-8 shadow-lg rounded-lg w-96">
      <h2 class="text-2xl font-bold mb-6">Iniciar Sesión</h2>
      <form @submit.prevent="handleLogin">
        <input
          v-model="email"
          type="email"
          placeholder="Correo"
          class="w-full p-2 border mb-4"
          required
        />
        <input
          v-model="password"
          type="password"
          placeholder="Contraseña"
          class="w-full p-2 border mb-4"
          required
        />
        <button class="w-full bg-blue-500 text-white p-2">Ingresar</button>
      </form>
      <p class="mt-4">
        ¿No tienes cuenta?
        <router-link to="/register" class="text-blue-500"
          >Regístrate</router-link
        >
      </p>
    </div>
  </div>
</template>

<script setup>
import { ref } from "vue";
import { useAuthStore } from "../stores/auth";
import { useRouter } from "vue-router";

const email = ref("");
const password = ref("");
const authStore = useAuthStore();
const router = useRouter();

const handleLogin = async () => {
  try {
    await authStore.login({ email: email.value, password: password.value });
    router.push("/profile");
  } catch (error) {
    alert(error.message);
  }
};
</script>
<script>
export default {
  name: "LoginPage", // 🔹 Cambio de nombre del componente para cumplir con la regla de Vue 3
};
</script>
