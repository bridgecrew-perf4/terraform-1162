# Example

This Terraform configuration creates a kubernetes pod and service in the namespace.

## Chose subscription and export environment variables to configure the Azure Terraform provider.

```bash
sh vars.sh
```

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
terraform init k8s-aks
```

### If there isn't, you can import resource
```bash
terraform import azurerm_kubernetes_cluster.k8s /subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/group1/providers/Microsoft.ContainerService/managedClusters/cluster1
```

```bash
terraform plan \
	-var 'location=East US' \
	-var 'resource_group_name=trak-e-microservices' \
	-var 'cluster_name=aks-trake' \
	-var 'agent_count=3' \
	-var 'dns_prefix=aks-trake' \
	-var 'vnet_name=aks-vnet' \
	-var 'vnet_subnet_id=/subscriptions/9d62d185-fedf-4d04-a291-f48c4ad048a5/resourceGroups/trak-e-microservices/providers/Microsoft.Network/virtualNetworks/aks-vnet/subnets/aks-snet' \
	-var 'subnet_name=aks-subnet' \
	-var 'address_space= [ "172.16.0.0/16" ]' \
	-var 'subnet_address_space= [ "172.16.1.0/24" ]' \
	-var 'vm_size=Standard_D8s_v3' \
	-var 'os_disk_size_gb=30' \
	-var 'max_pods=70' \
	-var 'min_count=3' \
	-var 'max_count=5' \
	azure/k8s-aks
```

```bash
terraform apply \
	-var 'location=East US' \
	-var 'resource_group_name=trak-e-microservices' \
	-var 'cluster_name=aks-trake' \
	-var 'agent_count=3' \
	-var 'dns_prefix=aks-trake' \
	-var 'vnet_name=aks-vnet' \
	-var 'vnet_subnet_id=/subscriptions/9d62d185-fedf-4d04-a291-f48c4ad048a5/resourceGroups/trak-e-microservices/providers/Microsoft.Network/virtualNetworks/aks-vnet/subnets/aks-snet' \
	-var 'subnet_name=aks-subnet' \
	-var 'address_space= [ "172.16.0.0/16" ]' \
	-var 'subnet_address_space= [ "172.16.1.0/24" ]' \
	-var 'vm_size=Standard_D8s_v3' \
	-var 'os_disk_size_gb=30' \
	-var 'max_pods=70' \
	-var 'min_count=3' \
	-var 'max_count=5' \
	azure/k8s-aks
```

*Creating a kubernetes service of `Type=LoadBalancer` might take upwards of 3-5 mins since
Azure is creating a load balancer in the background and Terraform will wait for the
load balancer to be available.*

Check whether pod, service, and namespace is created successfully

```bash
kubectl get pods,services,namespace
```

### Ref: https://www.terraform.io/docs/providers/azurerm/r/kubernetes_cluster.html