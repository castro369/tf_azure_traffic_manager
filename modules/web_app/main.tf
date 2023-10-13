resource "azurerm_service_plan" "example" {
  name                = var.plan_name
  resource_group_name = var.rg_name
  location            = var.plan_location
  os_type             = var.plan_os_type
  sku_name            = var.plan_sku_name
}

resource "azurerm_linux_web_app" "example" {
  name                = var.app_name
  resource_group_name = var.rg_name
  location            = var.app_location
  service_plan_id     = azurerm_service_plan.example.id
  https_only          = true

  site_config {
    minimum_tls_version = "1.2"
  }
}

#  Deploy code from a public GitHub repo
resource "azurerm_app_service_source_control" "sourcecontrol" {
  app_id                 = azurerm_linux_web_app.example.id
  repo_url               = "https://github.com/Azure-Samples/nodejs-docs-hello-world"
  branch                 = "master"
  use_manual_integration = true
  use_mercurial          = false
}