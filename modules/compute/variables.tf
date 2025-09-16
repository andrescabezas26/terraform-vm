# Compute Module Variables
variable "vm_name" {
  type        = string
  description = "Name of the virtual machine"
}

variable "nic_name" {
  type        = string
  description = "Name of the network interface"
}

variable "location" {
  type        = string
  description = "Azure region for resources"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
  default     = {}
}

variable "vm_size" {
  type        = string
  description = "Size of the virtual machine"
  default     = "Standard_B1s"
}

variable "admin_username" {
  type        = string
  description = "Admin username for the VM"
  default     = "azureuser"
}

variable "admin_password" {
  type        = string
  description = "Admin password for the VM (used only when SSH keys are disabled)"
  default     = null
  sensitive   = true
}

variable "enable_ssh_key_auth" {
  type        = bool
  description = "Enable SSH key authentication"
  default     = true
}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key for authentication"
  default     = null
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet"
}

variable "public_ip_id" {
  type        = string
  description = "ID of the public IP"
}

variable "nsg_id" {
  type        = string
  description = "ID of the network security group"
}

variable "disk_type" {
  type        = string
  description = "Type of managed disk"
  default     = "Premium_LRS"
}

variable "disk_size_gb" {
  type        = number
  description = "Size of the OS disk in GB"
  default     = 30
}

variable "image_publisher" {
  type        = string
  description = "OS image publisher"
  default     = "Canonical"
}

variable "image_offer" {
  type        = string
  description = "OS image offer"
  default     = "0001-com-ubuntu-server-focal"
}

variable "image_sku" {
  type        = string
  description = "OS image SKU"
  default     = "20_04-lts-gen2"
}

variable "image_version" {
  type        = string
  description = "OS image version"
  default     = "latest"
}