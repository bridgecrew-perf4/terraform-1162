terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

module "elastic_beanstalk_application" {
  source      = "git::https://github.com/cloudposse/terraform-aws-elastic-beanstalk-application.git?ref=tags/0.7.1"
  namespace   = var.namespace
  stage       = var.stage
  name        = var.name
}

module "elastic_beanstalk_environment" {
  source                             = "git::https://github.com/cloudposse/terraform-aws-elastic-beanstalk-environment.git?ref=tags/0.31.0"
  namespace                          = var.namespace
  stage                              = var.stage
  name                               = var.name
  region                             = var.region
  availability_zone_selector         = var.availability_zone_selector
  #dns_zone_id                        = var.dns_zone_id
  elastic_beanstalk_application_name = module.elastic_beanstalk_application.elastic_beanstalk_application_name

  instance_type           = var.instance_type
  autoscale_min           = var.autoscale_min
  autoscale_max           = var.autoscale_max
  updating_min_in_service = var.updating_min_in_service
  updating_max_batch      = var.updating_max_batch

  loadbalancer_type       = var.loadbalancer_type
  vpc_id                  = var.vpc_id
  loadbalancer_subnets    = var.loadbalancer_subnets
  application_subnets     = var.application_subnets
  #allowed_security_groups = var.allowed_security_groups

  force_destroy = var.force_destroy
  // https://docs.aws.amazon.com/elasticbeanstalk/latest/platforms/platforms-supported.html
  // https://docs.aws.amazon.com/elasticbeanstalk/latest/platforms/platforms-supported.html#platforms-supported.docker
  solution_stack_name = var.solution_stack_name
  additional_settings = var.additional_settings

  
}


