import { Client } from 'pg';

export default defineNuxtPlugin(() => {
  const client = new Client({
    user: 'postgres',
    password: 'postgres',
    host: 'localhost',
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
