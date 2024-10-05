DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_database
        WHERE datname = 'my_new_database'
    ) THEN
        PERFORM dblink_exec('dbname=postgres', 'CREATE DATABASE emp');
    END IF;
END $$;
