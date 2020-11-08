# Provider section
provider "azurerm" {
  version = ">= 0.12"
  features {}
}

# Resources section
resource "azurerm_subnet" "snet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.subnet_address_space
}