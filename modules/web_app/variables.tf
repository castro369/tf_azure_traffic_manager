variable "plan_name" {
  description = "Name of Service Plan"
  type        = string
}

variable "app_name" {
  description = "Name of Web Application"
  type        = string
}

variable "rg_name" {
  description = "Name of Resource Group"
  type        = string
}

variable "plan_os_type" {
  description = "Service Plan OS type"
  type        = string
  default     = "Linux"
}

variable "plan_sku_name" {
  description = "Service Plan SKU Name"
  type        = string
  default     = "P1v2"
}

variable "plan_location" {
  description = "Location of Service Plan"
  type        = string
}

variable "app_location" {
  description = "Location of Web Application"
  type        = string
}
