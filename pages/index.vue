<script setup lang="ts">
import type { Reactive } from 'vue';
import type { Todo } from '~/types/todo';

useHead({
  title: 'Todos',
  meta: [
    {
      name: 'description',
      content: 'A simple todo app',
    },
  ],
});

const { $client } = useNuxtApp();

const todos = useState(() => [] as Todo[]);

async function fetchTodos() {
  const res = await $client.query('SELECT * FROM todos');
  const headers: Todo = res.fields.reduce((acc: {[key: string]: any} extends Todo ? Todo : any, field) => {
    acc[field.name] = field.name;
    return acc;
  }, {});
  const todoData: Reactive<Todo[]> = reactive(res.rows);
  return { headers, todoData, rowCount: res.rowCount };
}

const { headers, todoData, rowCount } = await fetchTodos();
todos.value = todoData;

watch(() => todos, async (value, oldValue) => {
  console.log({value, oldValue});
  
  // await $client.query('UPDATE todos SET completed = $1 WHERE id = $2', [todo.completed, todo.id]);
});

const handleChange = () => {
  console.log('handleChange');
};
</script>

<template>
  <div v-if="!rowCount">
    <h1>Error</h1>
  </div>
  <div v-else>
    <h1>Todos</h1>
    <table class="todo-table">
      <thead>
        <tr>
          <th>{{ headers.completed }}</th>
          <th>{{ headers.id }}</th>
          <th>{{ headers.title }}</th>
          <th>{{ headers.description }}</th>
          <th>{{ headers.created_at }}</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="todo in todos" :key="todo.id">
          <td><input type="checkbox" v-model="todo.completed" @change="handleChange" /></td>
          <td>{{ todo.id }}</td>
          <td>{{ todo.title }}</td>
          <td>{{ todo.description }}</td>
          <td>{{ todo.created_at.toLocaleDateString() }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<style scoped>
.todo-table {
  width: 100%;
  border-collapse: collapse;
}

.todo-table th,
.todo-table td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

.todo-table th {
  background-color: #f2f2f2;
  text-transform: capitalize;
}

.todo-table tbody tr:nth-child(even) {
  background-color: #f9f9f9;
}

.todo-table tbody tr:hover {
  background-color: #f5f5f5;
}

.todo-table input[type="checkbox"] {
  margin-right: 8px;
}
</style>
