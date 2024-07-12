CREATE USER :username PASSWORD :'password';
ALTER USER :username WITH SYSLOG ACCESS UNRESTRICTED;
GRANT SELECT ON pg_catalog.STL_CONNECTION_LOG, pg_catalog.SVL_STATEMENTTEXT, pg_catalog.STL_SESSIONS, pg_catalog.PG_USER, pg_catalog.STV_SESSIONS TO :username;
\q