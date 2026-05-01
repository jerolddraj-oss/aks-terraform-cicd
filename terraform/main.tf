data "azurerm_resource_group" "aks_rg" {
  name = var.resource_group_name
}

data "azurerm_virtual_network" "aks_vnet" {
  name                = "aks-vnet"
  resource_group_name = var.resource_group_name
}
data "azurerm_subnet" "aks_subnet" {
  name                 = "aks-subnet"
  virtual_network_name = "aks-vnet"
  resource_group_name  = var.resource_group_name
}
data "azurerm_log_analytics_workspace" "log" {
  name                = "aks-log-workspace"
  resource_group_name = var.resource_group_name
}
module "aks" {
  source = "./modules/aks"

  cluster_name = var.cluster_name
  location = var.location
  resource_group_name = data.azurerm_resource_group.aks_rg.name
  dns_prefix = "jdaks"

  node_count = var.node_count
  vm_size    = var.vm_size

  subnet_id = data.azurerm_subnet.aks_subnet.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.log.id

  tags = {
    Environment = var.environment
  }
}