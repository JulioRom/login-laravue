<template>
  <div class="min-h-screen flex items-center justify-center bg-gray-100">
    <div class="bg-white p-8 rounded-lg shadow-lg w-96">
      <h2 class="text-2xl font-bold text-center mb-6">Perfil de Usuario</h2>

      <div v-if="user">
        <p class="text-lg">
          <strong>Nombre:</strong> {{ user.first_name }} {{ user.last_name }}
        </p>
        <p class="text-lg"><strong>Teléfono:</strong> {{ user.phone }}</p>
        <p class="text-lg"><strong>Email:</strong> {{ user.email }}</p>
        <p class="text-sm text-gray-500 mt-2">
          Última actualización: {{ lastUpdated }}
        </p>
      </div>

      <div v-else class="text-center text-gray-500">Cargando perfil...</div>

      <button
        @click="logout"
        class="w-full mt-6 bg-red-500 text-white py-2 px-4 rounded hover:bg-red-600"
      >
        Cerrar Sesión
      </button>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from "vue";
import { useAuthStore } from "../stores/auth";
import api from "../api";
import { useRouter } from "vue-router";

const authStore = useAuthStore();
const router = useRouter();
const user = ref(authStore.user);
const lastUpdated = ref("");

const fetchProfile = async () => {
  try {
    const response = await api.get("/profile", {
      headers: { Authorization: `Bearer ${authStore.token}` },
    });
    user.value = response.data;
    lastUpdated.value = new Date().toLocaleString();
  } catch (error) {
    console.error("Error al obtener perfil:", error);
    authStore.logout();
    router.push("/login");
  }
};

// Obtener el perfil cuando se carga la vista
onMounted(fetchProfile);

const logout = () => {
  authStore.logout();
  router.push("/login");
};
</script>

<script>
export default {
  name: "ProfilePage", // 🔹 Cambio de nombre del componente para cumplir con la regla de Vue 3
};
</script>
