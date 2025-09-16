output "public_ip" {
  description = "Dirección IP pública de la VM"
  value       = azurerm_public_ip.public_ip.ip_address
}

output "vm_name" {
  description = "Nombre de la máquina virtual"
  value       = azurerm_linux_virtual_machine.vm.name
}
