# Network Module Outputs
output "vnet_id" {
  description = "ID of the virtual network"
  value       = azurerm_virtual_network.main.id
}

output "vnet_name" {
  description = "Name of the virtual network"
  value       = azurerm_virtual_network.main.name
}

output "subnet_id" {
  description = "ID of the subnet"
  value       = azurerm_subnet.internal.id
}

output "public_ip_id" {
  description = "ID of the public IP"
  value       = azurerm_public_ip.main.id
}

output "public_ip_address" {
  description = "Public IP address"
  value       = azurerm_public_ip.main.ip_address
}