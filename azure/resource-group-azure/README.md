# Example

This Terraform configuration creates a kubernetes pod and service in the namespace.

## Chose subscription and export environment variables to configure the Azure Terraform provider.

```bash
sh vars.sh
```

## Run Terraform init, plan and apply
 

```bash
terraform init resource-group-azure
```

```bash
terraform import azurerm_resource_group.azure /subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/group1/providers/Microsoft.ContainerService/managedClusters/cluster1
```

```bash
terraform plan -var 'location=East US' -var 'resource_group_name=trak-e-microservices' resource-group-azure
```

```bash
terraform apply -var 'location=East US' -var 'resource_group_name=trak-e-microservices' resource-group-azure
```

### Ref: https://www.terraform.io/docs/providers/azurerm/r/kubernetes_cluster.html