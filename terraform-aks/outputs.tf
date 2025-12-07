output "rg_name" {
  description = "The name of the resource group"
  value = azurerm_resource_group.flask_rg.name
}

output "aks_cluster_name" {
  description = "The name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.flask_aks_cluster.name
}

output "aks_version" {
  description = "The Kubernetes version running on this AKS cluster"
  value       = azurerm_kubernetes_cluster.flask_aks_cluster.kubernetes_version
}

output "aks_fqdn" {
  description = "The FQDN of the AKS API server"
  value       = azurerm_kubernetes_cluster.flask_aks_cluster.fqdn
}

output "aks_node_resource_group" {
  description = "The resource group with AKS infrastructure resources"
  value       = azurerm_kubernetes_cluster.flask_aks_cluster.node_resource_group
}