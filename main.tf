# Main Terraform configuration using modules

# 1. Resource Group
resource "azurerm_resource_group" "main" {
  name     = "${local.name_prefix}-rg"
  location = var.location
  tags     = local.common_tags
}

# 2. Network Module
module "network" {
  source = "./modules/network"

  vnet_name           = "${local.name_prefix}-vnet"
  subnet_name         = "${local.name_prefix}-subnet"
  public_ip_name      = "${local.name_prefix}-pip"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  tags                = local.common_tags
}

# 3. Security Module
module "security" {
  source = "./modules/security"

  nsg_name            = "${local.name_prefix}-nsg"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  allowed_ssh_cidr    = var.allowed_ssh_cidr
  tags                = local.common_tags
}

# 4. Compute Module
module "compute" {
  source = "./modules/compute"

  vm_name              = "${local.name_prefix}-vm"
  nic_name             = "${local.name_prefix}-nic"
  location             = azurerm_resource_group.main.location
  resource_group_name  = azurerm_resource_group.main.name
  vm_size              = var.vm_size
  admin_username       = var.admin_username
  admin_password       = var.admin_password
  enable_ssh_key_auth  = false
  ssh_public_key       = null
  subnet_id            = module.network.subnet_id
  public_ip_id         = module.network.public_ip_id
  nsg_id               = module.security.nsg_id
  tags                 = local.common_tags
}


