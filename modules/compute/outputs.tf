# Compute Module Outputs
output "vm_id" {
  description = "ID of the virtual machine"
  value       = azurerm_linux_virtual_machine.main.id
}

output "vm_name" {
  description = "Name of the virtual machine"
  value       = azurerm_linux_virtual_machine.main.name
}

output "private_ip_address" {
  description = "Private IP address of the VM"
  value       = azurerm_network_interface.main.private_ip_address
}

output "nic_id" {
  description = "ID of the network interface"
  value       = azurerm_network_interface.main.id
}

output "vm_identity" {
  description = "System assigned identity of the VM"
  value       = azurerm_linux_virtual_machine.main.identity[0].principal_id
}