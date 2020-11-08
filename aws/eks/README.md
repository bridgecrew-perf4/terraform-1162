# Example

```bash

```

## Run Terraform init, plan and apply
 

```bash
terraform init \
	aws/eks
```

### If there isn't, you can import resource
```bash
terraform import 

```

```bash
terraform apply \
	-var-file=aws/eks/xxxxxxxxx.tfvars \
	aws/eks
```

```bash
terraform apply \
	-var-file=aws/eks/xxxxxxxxx.tfvars \
	aws/eks
```

#### Ref: https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest
#### Ref: https://github.com/terraform-aws-modules/terraform-aws-eks