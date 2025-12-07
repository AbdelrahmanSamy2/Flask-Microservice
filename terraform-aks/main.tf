resource "azurerm_resource_group" "flask_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "flask_aks_cluster" {
  name                = var.cluster_name
  location            = azurerm_resource_group.flask_rg.location
  resource_group_name = azurerm_resource_group.flask_rg.name
  dns_prefix          = var.cluster_dns_prefix

    default_node_pool {
    name       = var.node_pool_name
    node_count = var.node_count
    vm_size    = var.node_vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = var.network_plugin
    load_balancer_sku = var.load_balancer_sku
    outbound_type     = var.outbound_type
  }

}