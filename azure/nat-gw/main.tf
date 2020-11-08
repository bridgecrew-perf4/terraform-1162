provider "azurerm" {
   features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "nat-gateway-rg"
  location = "eastus"
}

resource "azurerm_public_ip" "p-ip" {
  name                = "nat-gateway-publicIP"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
  #zones               = ["1"]

  tags = {
    environment = "Production"
  }  
}

resource "azurerm_public_ip_prefix" "p-ip-px" {
  name                = "nat-gateway-publicIPPrefix"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  prefix_length       = 31
  #zones               = ["1"]
  tags = {
    environment = "Production"
  }  
}

resource "azurerm_nat_gateway" "nat-gw" {
  name                    = "trake-nat-gateway"
  location                = azurerm_resource_group.rg.location
  resource_group_name     = azurerm_resource_group.rg.name
  public_ip_address_ids   = [azurerm_public_ip.p-ip.id]
  public_ip_prefix_ids    = [azurerm_public_ip_prefix.p-ip-px.id]
  sku_name                = "Standard"
  idle_timeout_in_minutes = 10
  #zones                   = ["1"]

  tags = {
    environment = "Production"
  }  
}

resource "azurerm_subnet_nat_gateway_association" "nat-gw-ass" {
  subnet_id      = "/subscriptions/9d62d185-fedf-4d04-a291-f48c4ad048a5/resourceGroups/trak-e-microservices/providers/Microsoft.Network/virtualNetworks/e-aks-vnet/subnets/e-aks-snet"
  nat_gateway_id = azurerm_nat_gateway.nat-gw.id
}