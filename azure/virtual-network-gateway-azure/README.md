# Example

This Terraform configuration creates a kubernetes pod and service in the namespace.

## You can execute to command "az accounts..." and see the list of options

```bash
az account list-locations -o table | more #locations
az account list -o table #subscription
az resource list -o table #resource-group
az network vnet list #vnet
az network vnet subnet list -g XXXXXXXXX --vnet-name XXXXXX #subnet
```
### Ref: https://docs.microsoft.com/en-us/cli/azure/reference-index?view=azure-cli-latest
### Ref: https://docs.microsoft.com/en-us/rest/api/compute/virtualmachines/listavailablesizes

## Run Terraform init, plan and apply
 

```bash
terraform init virtual-network-gateway-azure
```

### If there isn't, you can import resource
```bash
terraform import azurerm_virtual_network_gateway.exampleGateway /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myGroup1/providers/Microsoft.Network/virtualNetworkGateways/myGateway1
```

```bash
terraform plan \
	-var \
	virtual-network-gateway-azure
```

```bash
terraform apply \
	-var \
	virtual-network-gateway-azure
```
### Ref: https://www.terraform.io/docs/providers/azurerm/r/virtual_network_gateway.html