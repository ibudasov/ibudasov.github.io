# Azure API version

When importing resources to Terraform state from Azure environment, it is important to specify API version, as described here:

https://registry.terraform.io/providers/Azure/azapi/latest/docs/resources/azapi_resource#import

Fair to say that is not always needed, but only in cases when the `import` results are invalid

The versions in the import command and in the terraformed definition should match:

```hcl
resource "azapi_resource" "vpng-p2s" {
  type      = "Microsoft.Network/p2sVpnGateways@2023-05-01"
}
```

Which version is specified in the Azure Portal does not really matter
