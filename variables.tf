# Project Configuration
variable "project_name" {
  type        = string
  description = "Nombre del proyecto"
  default     = "terraform-vm"
  
  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.project_name))
    error_message = "El nombre del proyecto debe contener solo letras minúsculas, números y guiones."
  }
}

variable "environment" {
  type        = string
  description = "Ambiente de despliegue"
  default     = "dev"
  
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "El ambiente debe ser dev, staging o prod."
  }
}

variable "owner" {
  type        = string
  description = "Propietario del recurso"
  default     = "DevOps-Team"
}

# Azure Configuration
variable "location" {
  type        = string
  description = "Ubicación de Azure"
  default     = "East US"
  
  validation {
    condition = contains([
      "East US", "East US 2", "West US", "West US 2", "West US 3",
      "Central US", "North Central US", "South Central US", "West Central US"
    ], var.location)
    error_message = "Selecciona una región válida de Azure."
  }
}

# VM Configuration
variable "vm_size" {
  type        = string
  description = "Tamaño de la VM"
  default     = "Standard_B1s"
  
  validation {
    condition = contains([
      "Standard_B1s", "Standard_B1ms", "Standard_B2s", "Standard_B2ms"
    ], var.vm_size)
    error_message = "Selecciona un tamaño de VM válido."
  }
}

variable "admin_username" {
  type        = string
  description = "Usuario administrador de la VM"
  default     = "azureuser"
  
  validation {
    condition     = can(regex("^[a-z][a-z0-9]{2,}$", var.admin_username))
    error_message = "El username debe empezar con letra minúscula y tener al menos 3 caracteres."
  }
}

# Security Configuration
variable "allowed_ssh_cidr" {
  type        = list(string)
  description = "CIDR blocks permitidos para SSH"
  default     = ["0.0.0.0/0"]  # ⚠️ Cambiar por tu IP específica
}

variable "admin_password" {
  type        = string
  description = "Contraseña del usuario administrador de la VM"
  sensitive   = true
}

# Compliance and Governance
variable "cost_center" {
  type        = string
  description = "Centro de costos para facturación"
  default     = "IT-Infrastructure"
}

variable "data_classification" {
  type        = string
  description = "Clasificación de datos"
  default     = "Internal"
  
  validation {
    condition     = contains(["Public", "Internal", "Confidential", "Restricted"], var.data_classification)
    error_message = "Data classification must be Public, Internal, Confidential, or Restricted."
  }
}

variable "backup_required" {
  type        = bool
  description = "Requiere backup automático"
  default     = true
}

variable "monitoring_level" {
  type        = string
  description = "Nivel de monitoreo requerido"
  default     = "Standard"
  
  validation {
    condition     = contains(["Basic", "Standard", "Enhanced"], var.monitoring_level)
    error_message = "Monitoring level must be Basic, Standard, or Enhanced."
  }
}
