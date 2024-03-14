# Bicep

## Quickstart

https://learn.microsoft.com/en-us/azure/virtual-machines/windows/quick-create-bicep?tabs=CLI

```sh
az group create --name igor_playground --location westeurope
az resource list --resource-group igorRG
az deployment group create --resource-group igorRG --template-file main.bicep
az group delete --name igor_playground
```

