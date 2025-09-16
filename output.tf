# Main outputs using module outputs
output "public_ip_address" {
  description = "Dirección IP pública de la VM"
  value       = module.network.public_ip_address
}

output "private_ip_address" {
  description = "Dirección IP privada de la VM"
  value       = module.compute.private_ip_address
}

# VM outputs
output "vm_name" {
  description = "Nombre de la máquina virtual"
  value       = module.compute.vm_name
}

output "vm_id" {
  description = "ID de la máquina virtual"
  value       = module.compute.vm_id
}

output "resource_group_name" {
  description = "Nombre del grupo de recursos"
  value       = azurerm_resource_group.main.name
}

# SSH connection details
output "ssh_connection_command" {
  description = "Comando para conectarse por SSH"
  value       = "ssh ${var.admin_username}@${module.network.public_ip_address}"
}

# VM password (sensitive)
output "vm_admin_password" {
  description = "Contraseña del administrador de la VM"
  value       = var.admin_password
  sensitive   = true
}
