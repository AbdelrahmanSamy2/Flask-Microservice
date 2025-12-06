resource "azurerm_resource_group" "rg" {
  name     = "rg-flask-app"
  location = "westeurope"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-flask-app"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aks-flask-app-dns"

  default_node_pool {
    name       = "systempool"
    node_count = 1
    vm_size    = "standard_b2s_v2"
  }

  # Use a managed identity for the cluster
  identity {
    type = "SystemAssigned"
  }

  # Enable RBAC
  role_based_access_control_enabled = true

  # Simple network profile using Azure CNI and a standard LB
  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
    outbound_type     = "loadBalancer"
  }
}

