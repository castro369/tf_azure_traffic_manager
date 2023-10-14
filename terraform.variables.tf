# Global Variables
variable "rg_name" {
  description = "Name of Resource Group"
  type        = string
  default     = "global-app-deployment"
}

variable "rg_location" {
  description = "Location of Resource Group"
  type        = string
  default     = "West Europe"
}

# Web Application Variables
variable "web_apps" {
  description = "Configuration map for web apps"
  type = map(object({
    plan_name     = string
    plan_location = string
    plan_sku_name = string
    app_name      = string
    app_location  = string
  }))

  default = {
    "app1" = {
      plan_name     = "app-plan-1"
      plan_location = "West Europe"
      plan_sku_name = "P1v2" # Needs to have Standard SKU
      app_name      = "app1"
      app_location  = "West Europe"
    },
    "app2" = {
      plan_name     = "app-plan-2"
      plan_location = "North Europe"
      plan_sku_name = "P1v2" # Needs to have Standard SKU
      app_name      = "app2"
      app_location  = "North Europe"
    }
  }
}

# Traffic Manager Variables
variable "traffic_manager_name" {
  description = "Routing Method for Traffic Manager"
  type        = string
  default     = "traffic-manager-profile"
}

variable "traffic_routing_method" {
  description = "Routing Method for Traffic Manager"
  type        = string
  default     = "Performance"
}

variable "traffic_manager_dns_name" {
  description = "Custom DNS name given to Traffic Manager"
  type        = string
  default     = "mylilwebsite"
}

