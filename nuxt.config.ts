import routes from './routes';

// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2024-04-03',
  devtools: { enabled: true },
  ssr: true,
  routeRules: routes,
  plugins: ['~/plugins/db.ts'],
});
