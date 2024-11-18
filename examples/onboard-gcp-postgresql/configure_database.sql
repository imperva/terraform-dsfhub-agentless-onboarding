DO
$$
BEGIN
  RAISE NOTICE 'Creating audit extension "pgaudit".';
  IF EXISTS (SELECT FROM pg_catalog.pg_extension WHERE extname = 'pgaudit') THEN
    RAISE NOTICE 'Audit extension "pgaudit" already exists. Skipping.';
  ELSE
    CREATE EXTENSION pgaudit;
  END IF;
END
$$;
