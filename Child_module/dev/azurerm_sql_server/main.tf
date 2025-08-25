resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = var.sql_resource_group_name
  location                     = var.sql_server_location
  version                      = "12.0"
  administrator_login          = "useradmin"
  administrator_login_password = "User@1234"
  minimum_tls_version          = "1.2"

  tags = var.sql_tags
}