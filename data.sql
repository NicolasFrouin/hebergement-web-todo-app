-- Create the 'todos' table
CREATE TABLE todos (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  completed BOOLEAN DEFAULT false,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data
INSERT INTO todos (title, description, completed) VALUES
  ('Learn SQL', 'Learn SQL basics', true),
  ('Learn Node.js', 'Learn Node.js basics', false),
  ('Learn React', 'Learn React basics', false),
  ('Learn GraphQL', 'Learn GraphQL basics', false),
  ('Learn TypeScript', 'Learn TypeScript basics', false),
  ('Learn Docker', 'Learn Docker basics', false),
  ('Learn Kubernetes', 'Learn Kubernetes basics', false),
  ('Learn AWS', 'Learn AWS basics', false),
  ('Learn GCP', 'Learn GCP basics', false),
  ('Learn Azure', 'Learn Azure basics', false);

