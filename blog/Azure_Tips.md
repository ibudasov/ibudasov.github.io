# Azure Tips

- In any resource group there is a toggle to show hidden elements
- If receive unclear error message -- try to lokk at JSON representation of this error. There might be more details
- in Bicep names are case-sensitive
- If terrafromed resource appars double in Azure Portal -- refresh the page and the double will disappear
- When searching for something anywhere on pages, use the full name of needed resource. Partial names would not be found
- Azure APIm -> HTTP methods: OPTIONS is called OPT
- for some tools like `aztfexport` presence of AZURE_TENANT_ID in the environment is mandatory. Tools usually would not throw any error, but will generate a faulty output