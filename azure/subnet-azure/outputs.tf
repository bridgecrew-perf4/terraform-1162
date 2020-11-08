output "subnet_id" {
  value = element(azurerm_subnet.snet.*.id, 0)
}