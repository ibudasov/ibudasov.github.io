# System managed Identity for 

## Context

To connect  Container Apps and PostgreSQL Flex the simplest way is to use login/pass. 
The smartest way is to use System Managed Identity

## How to

1. Container App
- Managed Identity needs to be enabled. It is enabled by default, if Milence module is used. To check it: Container Apps -> `app-booking-dev` -> Identity -> System Assigned -> Status -> On
2. PostgreSQL Flex
- https://learn.microsoft.com/en-us/azure/postgresql/flexible-server/how-to-manage-azure-ad-users#enable-microsoft-entra-authentication-for-an-existing-postgresql-role-using-sql
- https://learn.microsoft.com/en-us/azure/postgresql/flexible-server/how-to-connect-with-managed-identity

## Summary

So, basically,  what is happening:
- The application uses the same credentials, as it would use with login/pass, but the pass is replaced by the token
- The Managed Identity is created and destroyed with the application
- The token grants as much permissions as PostgreSQL grants: `SECURITY LABEL for "pgaadauth" on role "<roleName>" is 'aadauth,oid=<objectId>,type=<user|group|service>,admin';`

## Pro tips

- Check access - is an Azure Portal feature, which allows you to check if the MI created. Go to: PostgreSQL Flex -> `psql-flex-mil-common-mgt-we` -> Access Control -> Check Access -> Check Access
- Container Apps -> `app-booking-dev` -> Monitoring -> Console -- to get into the container and to test the connection
- PostgreSQL Flex -> `psql-flex-mil-common-mgt-we` -> Connect -- to test other connectivity options

## Hidden problems
- PostgreSQL Flex -> `psql-flex-mil-common-mgt-we` -> Authentication -> Microsoft Entra Admins -- Does not work with groups, so add individual users. You will need it to create the role on Postgres side