resource_group_name = "flask-resource-group"
location            = "westeurope"

cluster_name       = "flask-aks-cluster"
cluster_dns_prefix = "flask-aks-dns"

node_pool_name = "systempool"
node_count     = 1
node_vm_size   = "Standard_B2s_v2"

network_plugin    = "azure"
load_balancer_sku = "standard"
outbound_type     = "loadBalancer"