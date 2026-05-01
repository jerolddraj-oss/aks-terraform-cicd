data "azurerm_resource_group" "aks_rg" {
  name = var.resource_group_name
}

resource "azurerm_virtual_network" "aks_vnet" {
  name                = "aks-vnet"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.aks_rg.name
  address_space       = ["10.0.0.0/8"]
}

resource "azurerm_subnet" "aks_subnet" {
  name                 = "aks-subnet"
  resource_group_name  = data.azurerm_resource_group.aks_rg.name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = ["10.1.0.0/16"]
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

  subnet_id = azurerm_subnet.aks_subnet.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.log.id

  tags = {
    Environment = var.environment
  }
}