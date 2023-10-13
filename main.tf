# Random suffix to create unique named resources
resource "random_id" "suffix" {
  byte_length = 4
}

# Creates specific Resource Group for the deployment
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.rg_location
}

# Module deploys two web apps
module "web_app" {
  for_each = var.web_apps
  source   = "./modules/web_app"

  plan_name     = each.value.plan_name
  plan_location = each.value.plan_location
  app_name      = "${each.value.app_name}-${random_id.suffix.hex}"
  app_location  = each.value.app_location
  rg_name       = azurerm_resource_group.rg.name
  plan_sku_name = each.value.plan_sku_name
}

# Creates Traffic Manager Profile and Endpoints
resource "azurerm_traffic_manager_profile" "profile" {
  name                   = "${var.traffic_manager_name}-${random_id.suffix.hex}"
  resource_group_name    = azurerm_resource_group.rg.name
  traffic_routing_method = var.traffic_routing_method
  dns_config {
    relative_name = "${var.traffic_manager_dns_name}-${random_id.suffix.hex}"
    ttl           = 1
  }

  monitor_config {
    protocol                    = "HTTPS"
    port                        = 443
    path                        = "/"
    expected_status_code_ranges = ["200-202", "301-302"]
  }
}

resource "azurerm_traffic_manager_azure_endpoint" "endpoint" {
  for_each = module.web_app

  name               = each.value.app_name
  profile_id         = azurerm_traffic_manager_profile.profile.id
  weight             = "50"
  target_resource_id = each.value.app_id
}
