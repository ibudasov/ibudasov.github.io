# System managed Identity for 

## Context

To connect  Container Apps and PostgreSQL Flex the simplest way is to use login/pass. 
The smartest way is to use System Managed Identity

## How to

1. Container App
- Managed Identity needs to be enabled. It is enabled by default, if Milence module is used. To check it: Container Apps -> `app-booking-acc` -> Identity -> System Assigned -> Status -> On
2. PostgreSQL Flex
- add a RBAC role for the ContainerApp to connect to the PostgreSQL
- to the PostgreSQ add your Azure user, so you can login to the DB, and add your application, so it can authenticate:
  - AzPortal -> PostgeSQL Flex -> DB -> Authentication -> Microsoft Entra Admins -> igor@azure.com
  - AzPortal -> PostgeSQL Flex -> DB -> Authentication -> Microsoft Entra Admins -> app-booking-acc
    - at this point I would give it a try and log in from within my application. This operation suppose to create also a Postgres Role, and you suppose to be able to login. However, this is how it is documented. To follow the documentation - proceed to the next step.
  - group assignment does not work, even though it should, according to the documentation
- https://learn.microsoft.com/en-us/azure/postgresql/flexible-server/how-to-manage-azure-ad-users#enable-microsoft-entra-authentication-for-an-existing-postgresql-role-using-sql
  - login as an admin into Postgres: PostgreSQL Flex -> DB -> Connect
    ```
    export PGUSER=user@domain.onmicrosoft.com
    export PGPASSWORD="$(az account get-access-token --resource-type oss-rdbms --output tsv --query accessToken)"
    export PGHOST=psql-flex-mil-common-bkg-acc-we.postgres.database.azure.com
    export PGPORT=5432
    export PGDATABASE=booking
    echo $PGPASSWORD
    echo $PGUSER
    psql --set=sslmode=require```
  - Check if you already have a Postgres Role for your application principal:
    - switch to `postgres` DB: `booking=> \c postgres`
    - `select * from pgaadauth_list_principals(false);`
    - `select * from pgaadauth_list_principals(true);`
      - if there is no application name as `app-booking-acc` among roles - proceed
  - `select * from pgaadauth_create_principal('app-booking-acc', false, false);` --> Created role for "app-booking-acc"
- https://learn.microsoft.com/en-us/azure/postgresql/flexible-server/how-to-connect-with-managed-identity

## Summary

So, basically,  what is happening:
- The application uses the same credentials, as it would use with login/pass, but the pass is replaced by the token
- The Managed Identity is created and destroyed with the application
- The token grants as much permissions as PostgreSQL grants

## Pro tips

- Check access - is an Azure Portal feature, which allows you to check if the MI created. Go to: PostgreSQL Flex -> `psql-flex-mil-common-mgt-we` -> Access Control -> Check Access -> Check Access
- Container Apps -> `app-booking-dev` -> Monitoring -> Console -- to get into the container and to test the connection
- PostgreSQL Flex -> `psql-flex-mil-common-mgt-we` -> Connect -- to test other connectivity options

## Hidden problems
- PostgreSQL Flex -> `psql-flex-mil-common-mgt-we` -> Authentication -> Microsoft Entra Admins -- Does not work with groups, so add individual users. You will need it to create the role on Postgres side