sp_configure 'clr enabled', 1
GO
RECONFIGURE
GO
IF TYPE_ID('tSQLtPrivate') IS NOT NULL DROP TYPE tSQLtPrivate;
GO
IF EXISTS (SELECT 1 FROM sys.assemblies WHERE name = 'tSQLtCLR')
    DROP ASSEMBLY tSQLtCLR;
GO

CREATE ASSEMBLY tSQLtCLR FROM '$(tSQLtCLRTargetFile)' WITH PERMISSION_SET = EXTERNAL_ACCESS;
GO
