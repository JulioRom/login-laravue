<template>
  <div class="hello">
    <h1>{{ msg }}</h1>

    <nav>
      <ul>
        <li><router-link to="/login">Login</router-link></li>
        <li><router-link to="/register">Register</router-link></li>
        <li v-if="authStore.isAuthenticated">
          <router-link to="/profile">Profile</router-link>
        </li>
        <li v-if="authStore.isAuthenticated">
          <a href="#" @click.prevent="logout">Logout</a>
        </li>
      </ul>
    </nav>
  </div>
</template>

<script>
import { useAuthStore } from "../stores/auth";

export default {
  name: "HelloWorld",
  props: {
    msg: String,
  },
  setup() {
    const authStore = useAuthStore();

    const logout = () => {
      authStore.logout();
    };

    return {
      authStore,
      logout,
    };
  },
};
</script>

<style scoped>
.hello {
  text-align: center;
}
nav ul {
  list-style: none;
  padding: 0;
}
nav li {
  display: inline;
  margin: 0 10px;
}
nav a {
  color: #42b983;
  text-decoration: none;
  font-weight: bold;
}
nav a:hover {
  color: #2c3e50;
}
</style>
