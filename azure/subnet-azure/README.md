# Example

This Terraform configuration creates a kubernetes pod and service in the namespace.

## Chose subscription and export environment variables to configure the Azure Terraform provider.

```bash
sh vars.sh
```

## Run Terraform init, plan and apply
 

```bash
terraform init subnet-azure
```

```bash
terraform import azurerm_virtual_network.snet /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mygroup1/providers/Microsoft.Network/virtualNetworks/myvnet1/subnets/mysubnet1
```

```bash
terraform plan \
	-var 'resource_group_name=trak-e-microservices' \
	-var 'vnet_name=aks-vnet' \
	-var 'subnet_name=aks-snet' \
	-var 'subnet_address_space= [ "172.16.1.0/24" ]' \
	azure/subnet-azure
```

```bash
terraform apply \
	-var 'resource_group_name=trak-e-microservices' \
	-var 'vnet_name=aks-vnet' \
	-var 'subnet_name=aks-snet' \
	-var 'subnet_address_space= [ "172.16.1.0/24" ]' \
	azure/subnet-azure
```

### Ref: https://www.terraform.io/docs/providers/azurerm/r/subnet.html
