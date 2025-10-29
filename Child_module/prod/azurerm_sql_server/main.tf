resource "azurerm_mssql_server" "server" {
  name                         = var.sql_server_name
  resource_group_name          = var.sql_resource_group_name
  location                     = var.sql_server_location
  version                      = "12.0"
  administrator_login          = "missadministrator"
  administrator_login_password = "thisIsKat11"
  minimum_tls_version          = "1.2"

  tags = var.sql_tags
}