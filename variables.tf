variable "resource_group_name" {
  type        = string
  description = "Nombre del grupo de recursos"
  default     = "rg-vm-demo"
}

variable "location" {
  type        = string
  description = "Ubicación de Azure"
  default     = "East US"
}

variable "admin_username" {
  type        = string
  description = "Usuario administrador de la VM"
  default     = "azureuser"
}

variable "admin_password" {
  type        = string
  description = "Contraseña del usuario administrador"
  default     = "password1234!"
}
