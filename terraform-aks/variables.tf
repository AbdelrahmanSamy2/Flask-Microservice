variable "resource_group_name" {
  description = "Name of the resource group to create for the AKS cluster"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be created"
  type        = string
}

variable "cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "cluster_dns_prefix" {
  description = "DNS prefix for the AKS API server"
  type        = string
}

variable "node_pool_name" {
  description = "Name of the default system node pool"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the default node pool"
  type        = number
}

variable "node_vm_size" {
  description = "VM size for nodes in the default node pool"
  type        = string
}

variable "network_plugin" {
  description = "Network plugin to use for AKS (azure or kubenet)"
  type        = string
}

variable "load_balancer_sku" {
  description = "SKU of the Azure Load Balancer used by the cluster"
  type        = string
}

variable "outbound_type" {
  description = "How outbound traffic from the cluster is handled"
  type        = string
}