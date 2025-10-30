
resource "azurerm_kubernetes_cluster" "k8s" {
  name                = var.k8s_name
  location            = var.k8s_location
  resource_group_name = var.k8s_rg_name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2s_v3"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.k8s_tags
}