resource "azurerm_storage_account" "sa" {
    name =var.sa_name
    resource_group_name =var.rg_name
    location = var.sa_location
    account_tier = var.sa_tier
    account_replication_type = var.sa_replication_type
    tags = var.sa_tags
}
