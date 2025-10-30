locals {
  common_tags = {
    ManagedBy   = "terraform"
    Owner       = "ajayteam"
    Environment = "dev"
  }
}

module "rg" {
  source     = "../Child_module/dev/azurerm_resource_group"
  rg_name    = "git_rg"
  rg_location = "central india"
  rg_tags    = local.common_tags
}
module "sa" {
  depends_on          = [module.rg]
  source              = "../Child_module/dev/azurerm_storage_account"
  sa_name             = "aadibhai"
  rg_name             = "git_rg"
  sa_location         = "central india"
  sa_tier             = "Standard"
  sa_replication_type = "GRS"
  sa_tags             = local.common_tags
}
module "acr" {
  depends_on   = [module.rg]
  source       = "../Child_module/dev/azurerm_container_regisrty"
  acr_name     = "acraadibhai"
  acr_rgname   = "git_rg"
  acr_location = "central india"
  acr_tagname  = local.common_tags
}
module "sqlserver" {
  depends_on              = [module.rg]
  source                  = "../Child_module/dev/azurerm_sql_server"
  sql_server_name         = "aadiserver"
  sql_resource_group_name = "git_rg"
  sql_server_location     = "central india"
  sql_tags                = local.common_tags
}

module "sqldb" {
  depends_on    = [module.rg, module.sqlserver]
  source        = "../Child_module/dev/azurerm_sql_database"
  database_name = "aadi-db"
  server_id     = module.sqlserver.server_id
  tags          = local.common_tags
}
module "aks" {
  depends_on   = [module.rg]
  source       = "../Child_module/dev/azurerm_kubernets_cluster"
  k8s_name     = "aadi-k8s"
  k8s_location = "central india"
  k8s_rg_name  = "git_rg"
  dns_prefix   = "ajaydns"
  k8s_tags     = local.common_tags
}

module "pip" {
  depends_on = [ module.rg ]
  source = "../Child_module/dev/azurerm_public_ip"
  name = "aadi_pip"
  resource_group_name = "git_rg"
  location = "central india"
  allocation_method = "Static"
  tags = local.common_tags

}

#try apply