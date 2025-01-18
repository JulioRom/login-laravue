<template>
  <div class="min-h-screen flex items-center justify-center">
    <div class="bg-white p-8 shadow-lg rounded-lg w-96">
      <h2 class="text-2xl font-bold mb-6">Registro</h2>
      <form @submit.prevent="handleRegister">
        <input
          v-model="first_name"
          type="text"
          placeholder="Nombre"
          class="w-full p-2 border mb-4"
          required
        />
        <input
          v-model="last_name"
          type="text"
          placeholder="Apellido"
          class="w-full p-2 border mb-4"
          required
        />
        <input
          v-model="phone"
          type="text"
          placeholder="Teléfono"
          class="w-full p-2 border mb-4"
          required
        />
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
        <input
          v-model="password_confirmation"
          type="password"
          placeholder="Confirmar contraseña"
          class="w-full p-2 border mb-4"
          required
        />
        <button class="w-full bg-blue-500 text-white p-2">Registrar</button>
      </form>
      <p class="mt-4">
        ¿Ya tienes cuenta?
        <router-link to="/login" class="text-blue-500"
          >Inicia sesión</router-link
        >
      </p>
    </div>
  </div>
</template>

<script setup>
import { ref } from "vue";
import api from "../api";
import { useRouter } from "vue-router";

const first_name = ref("");
const last_name = ref("");
const phone = ref("");
const email = ref("");
const password = ref("");
const password_confirmation = ref("");

const router = useRouter();

const handleRegister = async () => {
  try {
    await api.post("/register", {
      first_name: first_name.value,
      last_name: last_name.value,
      phone: phone.value,
      email: email.value,
      password: password.value,
      password_confirmation: password_confirmation.value,
    });
    router.push("/login");
  } catch (error) {
    alert(error.response.data.error);
  }
};
</script>
<script>
export default {
  name: "RegisterPage", // 🔹 Cambio de nombre del componente para cumplir con la regla de Vue 3
};
</script>
