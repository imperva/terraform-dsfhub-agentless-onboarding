DO
$$
BEGIN
  RAISE NOTICE 'Creating auditor role "rds_pgaudit".';
  IF EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rds_pgaudit') THEN
    RAISE NOTICE 'Role "rds_pgaudit" already exists. Skipping.';
  ELSE
    CREATE ROLE rds_pgaudit;
  END IF;

  RAISE NOTICE 'Creating audit extension "pgaudit".';
  IF EXISTS (SELECT FROM pg_catalog.pg_extension WHERE extname = 'pgaudit') THEN
    RAISE NOTICE 'Audit extension "pgaudit" already exists. Skipping.';
  ELSE
    CREATE EXTENSION pgaudit;
  END IF;
END
$$;
