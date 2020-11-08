# Provider section
provider "azurerm" {
  version = ">= 0.12"
  features {}
}

# Resources section
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.address_space
}