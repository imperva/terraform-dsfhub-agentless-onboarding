DECLARE  
  @server_audit AS VARCHAR(50) = '$(server_audit)',
  @server_audit_spec_name AS VARCHAR(50) = '$(audit_spec_name)',
  @server_audit_spec AS VARCHAR(3000),
  @server_audit_status INT,
  @sql_command AS VARCHAR(3000)

USE master;

-- Create server audit
IF (EXISTS (SELECT * FROM sys.dm_server_audit_status where name = @server_audit))
  BEGIN 
    PRINT 'Server audit "' + @server_audit + '" already exists.';
  END
ELSE 
  BEGIN 
    PRINT 'Creating server audit "' + @server_audit + '"';

    SET @sql_command = 'CREATE SERVER AUDIT ' + @server_audit + ' TO EXTERNAL_MONITOR';
    EXECUTE(@sql_command);
  END;

-- Enable server audit
select @server_audit_status = status FROM sys.dm_server_audit_status where name = @server_audit;

IF (@server_audit_status = 1)
  BEGIN
    PRINT 'Server audit "' + @server_audit + '" is already enabled.';
  END;
ELSE 
  BEGIN 
    PRINT 'Enabling server audit "' + @server_audit + '"';

    SET @sql_command = 'ALTER SERVER AUDIT ' + @server_audit + ' WITH (STATE = ON)';
    EXECUTE(@sql_command);
  END;


-- Create server audit specification
IF (EXISTS (SELECT * FROM sys.server_audit_specifications where name = @server_audit_spec_name))
  BEGIN
    PRINT 'Server audit specification "' + @server_audit_spec_name + '" already exists.';
  END;
ELSE 
  BEGIN 
    PRINT 'Creating server audit specification "' + @server_audit_spec_name + '"';

    -- This creates a server audit specification that captures all server-level and database-level events.
    -- Modify or add additional groups as needed.
    -- For all action groups available, see https://learn.microsoft.com/en-us/sql/relational-databases/security/auditing/sql-server-audit-action-groups-and-actions?view=sql-server-ver15
    SET @server_audit_spec = 'ADD (APPLICATION_ROLE_CHANGE_PASSWORD_GROUP),
ADD (AUDIT_CHANGE_GROUP),
ADD (BACKUP_RESTORE_GROUP),
ADD (BATCH_COMPLETED_GROUP),
ADD (BATCH_STARTED_GROUP),
ADD (BROKER_LOGIN_GROUP),
ADD (DATABASE_CHANGE_GROUP),
ADD (DATABASE_LOGOUT_GROUP),
ADD (DATABASE_MIRRORING_LOGIN_GROUP),
ADD (DATABASE_OBJECT_ACCESS_GROUP),
ADD (DATABASE_OBJECT_CHANGE_GROUP),
ADD (DATABASE_OBJECT_OWNERSHIP_CHANGE_GROUP),
ADD (DATABASE_OBJECT_PERMISSION_CHANGE_GROUP),
ADD (DATABASE_OPERATION_GROUP),
ADD (DATABASE_OWNERSHIP_CHANGE_GROUP),
ADD (DATABASE_PERMISSION_CHANGE_GROUP),
ADD (DATABASE_PRINCIPAL_CHANGE_GROUP),
ADD (DATABASE_PRINCIPAL_IMPERSONATION_GROUP),
ADD (DATABASE_ROLE_MEMBER_CHANGE_GROUP),
ADD (DBCC_GROUP),
ADD (FAILED_DATABASE_AUTHENTICATION_GROUP),
ADD (FAILED_LOGIN_GROUP),
ADD (FULLTEXT_GROUP),
ADD (LOGIN_CHANGE_PASSWORD_GROUP),
ADD (LOGOUT_GROUP),
ADD (SCHEMA_OBJECT_ACCESS_GROUP),
ADD (SCHEMA_OBJECT_CHANGE_GROUP),
ADD (SCHEMA_OBJECT_OWNERSHIP_CHANGE_GROUP),
ADD (SCHEMA_OBJECT_PERMISSION_CHANGE_GROUP),
ADD (SERVER_OBJECT_CHANGE_GROUP),
ADD (SERVER_OBJECT_OWNERSHIP_CHANGE_GROUP),
ADD (SERVER_OBJECT_PERMISSION_CHANGE_GROUP),
ADD (SERVER_OPERATION_GROUP),
ADD (SERVER_PERMISSION_CHANGE_GROUP),
ADD (SERVER_PRINCIPAL_CHANGE_GROUP),
ADD (SERVER_PRINCIPAL_IMPERSONATION_GROUP),
ADD (SERVER_ROLE_MEMBER_CHANGE_GROUP),
ADD (SERVER_STATE_CHANGE_GROUP),
ADD (SUCCESSFUL_DATABASE_AUTHENTICATION_GROUP),
ADD (SUCCESSFUL_LOGIN_GROUP),
ADD (TRACE_CHANGE_GROUP),
ADD (TRANSACTION_GROUP),
ADD (USER_CHANGE_PASSWORD_GROUP),
ADD (USER_DEFINED_AUDIT_GROUP)
WITH (STATE = ON)';

    SET @sql_command = 'CREATE SERVER AUDIT SPECIFICATION ' + @server_audit_spec_name + ' FOR SERVER AUDIT ' + @server_audit + ' ' + @server_audit_spec;
    EXECUTE(@sql_command);
  END;

GO