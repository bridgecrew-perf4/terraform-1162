# Example

This Terraform configuration creates a kubernetes pod and service in the namespace.

## Export environment variables to configure the Digital Ocean Terraform provider.


### Go to url: https://cloud.digitalocean.com/account/api?i=cb0400 and you can create token ?
```bash
export DO_PAT="YOUR_PERSONAL_ACCESS_TOKEN"
```

## You can execute to command "curl" and see the list of options

```bash
curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer $DO_PAT" "https://api.digitalocean.com/v2/kubernetes/options" | jq | more
```

## Run Terraform init, plan and apply
 
```bash
terraform init
```

```bash
terraform import digitalocean_kubernetes_cluster.k8s xxxxxx-xxxx-xxxxx-xxxx-xxxxxx
```

```bash
terraform plan \
  -var-file=digitalocean/k8s-do/trake-do.tfvars \
  k8s-do 
```

```bash
terraform apply \
  -var-file=digitalocean/k8s-do/trake-do.tfvars \
  k8s-do
```

*Creating a kubernetes service of `Type=LoadBalancer` might take upwards of 3-5 mins since
Azure is creating a load balancer in the background and Terraform will wait for the
load balancer to be available.*

Check whether pod, service, and namespace is created successfully

```bash
kubectl get pods,services,namespace
```

### Ref: https://www.terraform.io/docs/providers/do/r/kubernetes_cluster.html