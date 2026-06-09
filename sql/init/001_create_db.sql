DO $$
BEGIN
   IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'dental_user') THEN
      CREATE ROLE dental_user LOGIN PASSWORD 'dental_pass';
   END IF;
END
$$;

DO $$
BEGIN
   IF NOT EXISTS (SELECT FROM pg_database WHERE datname = 'dentalmanager') THEN
      CREATE DATABASE dentalmanager OWNER dental_user;
   END IF;
END
$$;

GRANT ALL PRIVILEGES ON DATABASE dentalmanager TO dental_user;
