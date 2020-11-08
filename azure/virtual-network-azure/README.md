# Example

This Terraform configuration creates a kubernetes pod and service in the namespace.

## Chose subscription and export environment variables to configure the Azure Terraform provider.

```bash
sh vars.sh
```

## Run Terraform init, plan and apply
 

```bash
terraform init virtual-network-azure
```

```bash
terraform import azurerm_virtual_network.vnet /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mygroup1/providers/Microsoft.Network/virtualNetworks/myvnet1
```

```bash
terraform plan \
	-var 'location=East US' \
	-var 'resource_group_name=trak-e-microservices' \
	-var 'vnet_name=aks-vnet' \
	-var 'address_space= [ "172.16.0.0/16" ]' \
	azure/virtual-network-azure
```

```bash
terraform apply \
	-var 'location=East US' \
	-var 'resource_group_name=trak-e-microservices' \
	-var 'vnet_name=aks-vnet' \
	-var 'address_space= [ "172.16.0.0/16" ]' \
	azure/virtual-network-azure
```

### Ref: https://www.terraform.io/docs/providers/azurerm/r/virtual_network.html
