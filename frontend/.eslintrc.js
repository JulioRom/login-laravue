module.exports = {
  root: true,
  env: {
    node: true,
  },
  extends: [
    "plugin:vue/vue3-essential",
    "eslint:recommended",
    "plugin:prettier/recommended",
  ],
  parserOptions: {
    parser: "@babel/eslint-parser",
    ecmaVersion: 2020,
    requireConfigFile: false, // 🔹 Desactiva la verificación de Babel
  },
  rules: {
    "no-console": process.env.NODE_ENV === "production" ? "warn" : "off",
    "no-debugger": process.env.NODE_ENV === "production" ? "warn" : "off",
    "vue/multi-word-component-names": "off", // Opcional, si no quieres renombrar componentes
    "prettier/prettier": ["error", { endOfLine: "auto" }],
  },
};
