import pkg from 'pg';
const { Client } = pkg;

export default defineNuxtPlugin(() => {
  const client = new Client({
    user: 'postgres',
    password: 'postgres',
    host: 'db',
    database: 'todos',
    port: 5432,
  });
  client.connect().catch(() => {
    console.error('Failed to connect to the database');
  });
  return {
    provide: { client },
  };
});
