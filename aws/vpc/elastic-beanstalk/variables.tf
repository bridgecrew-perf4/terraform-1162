variable "stage" {
	type = string
}

variable "name" {
	type = string
}

variable "namespace" {
	type = string
}

variable "region" {
  type = string
}

variable "availability_zone_selector" {
	type = string
}

variable "availability_zones" {
	type = list(string)
}

variable "instance_type" {
	type = string
}

variable "autoscale_min" {
	type = string
}

variable "autoscale_max" {
	type = string
}

variable "updating_min_in_service" {
	type = string
}

variable "updating_max_batch" {
	type = string
}

variable "loadbalancer_type" {
	type = string
}

variable "vpc_id" {
	type = string
}

variable "loadbalancer_subnets" {
	type = list(string)
}

variable "application_subnets" {
	type = list(string)
}

variable "solution_stack_name" {
	type = string
}

variable "force_destroy" {
	type = string
}

variable "additional_settings" {
  type = list(object({
    namespace = string
    name      = string
    value     = string
  }))

  description = "Additional Elastic Beanstalk setttings. For full list of options, see https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/command-options-general.html"
  default     = []
}