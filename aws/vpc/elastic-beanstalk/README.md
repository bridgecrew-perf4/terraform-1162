# Example

```bash

```

## Run Terraform init, plan and apply
 

```bash
terraform init \
	aws/elastic-beanstalk
```

### If there isn't, you can import resource
```bash
terraform import 

```

```bash
terraform apply \
	-var-file=aws/elastic-beanstalk/xxxxxxxxx.tfvars \
	aws/elastic-beanstalk
```

```bash
terraform apply \
	-var-file=aws/elastic-beanstalk/xxxxxxxxx.tfvars \
	aws/elastic-beanstalk
```

#### Ref: https://registry.terraform.io/modules/cloudposse/elastic-beanstalk-environment/aws/latest
#### Ref: https://docs.aws.amazon.com/elasticbeanstalk/latest/platforms/platforms-supported.html#platforms-supported.java
#### Ref: https://github.com/cloudposse/terraform-aws-elastic-beanstalk-environment/tree/master/examples/complete