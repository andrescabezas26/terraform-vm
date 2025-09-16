# Network Module Variables
variable "vnet_name" {
  type        = string
  description = "Name of the virtual network"
}

variable "address_space" {
  type        = list(string)
  description = "Address space for the virtual network"
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnet"
}

variable "subnet_prefixes" {
  type        = list(string)
  description = "Address prefixes for the subnet"
  default     = ["10.0.1.0/24"]
}

variable "public_ip_name" {
  type        = string
  description = "Name of the public IP"
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