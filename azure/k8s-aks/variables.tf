## Azure config variables ##
variable "client_id" {}

variable "client_secret" {}

## Resource group variables ##
variable "resource_group_name" {
  type = string
}

variable location {
  type = string
}

## Key pub 
variable "ssh_public_key" {
  default = "~/.ssh/id_rsa.pub"
}

## AKS kubernetes cluster variables ##
variable "cluster_name" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "vnet_subnet_id" {
  description = "Resource id of the Virtual Network subnet"
  type        = string
}

variable "subnet_name" {
  type = string
}

variable "address_space" {
  description = "The address space (CIDR notation) of the Virtual Network"
  type        = list(string)
}

variable "subnet_address_space" {
  description = "The address space (CIDR notation) of the Virtual Network subnet"
  type        = list(string)
}

variable "agent_count" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "os_disk_size_gb" {
  type = string
}

variable "max_pods" {
  type  = string
}

variable "min_count" {
  type  = string
}

variable "max_count" {
  type = string
}

variable "dns_prefix" {
  type = string
}

variable "admin_username" {
  default = "azureuser"
}
