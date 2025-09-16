# Data sources for validation and compliance
data "azurerm_client_config" "current" {}

# Local values for naming and compliance
locals {
  # Naming convention validation
  valid_name_regex = "^[a-z0-9-]+$"
  
  # Resource naming conventions
  naming_convention = {
    resource_group     = "rg"
    virtual_network    = "vnet"
    subnet            = "snet"
    network_interface = "nic"
    virtual_machine   = "vm"
    public_ip         = "pip"
    network_security_group = "nsg"
    disk              = "disk"
  }
  
  # Compliance tags
  compliance_tags = merge(local.common_tags, {
    CostCenter      = var.cost_center
    Environment     = var.environment
    DataClass       = var.data_classification
    BackupRequired  = var.backup_required
    MonitoringLevel = var.monitoring_level
  })
}

# Validation checks
resource "terraform_data" "validation_checks" {
  lifecycle {
    precondition {
      condition = can(regex(local.valid_name_regex, var.project_name))
      error_message = "Project name must contain only lowercase letters, numbers, and hyphens."
    }
    
    precondition {
      condition = length(var.admin_username) >= 3 && length(var.admin_username) <= 20
      error_message = "Admin username must be between 3 and 20 characters."
    }
    
    precondition {
      condition = var.vm_size != "Standard_A0" && var.vm_size != "Basic_A0"
      error_message = "VM size cannot be A0 series (deprecated)."
    }
    
    precondition {
      condition = contains(["dev", "staging", "prod"], var.environment)
      error_message = "Environment must be dev, staging, or prod."
    }
  }
}