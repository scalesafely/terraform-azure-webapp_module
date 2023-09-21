variable "project_name" {
  type    = string
  
}

variable "subscription_id" {
  type    = string
  
}

variable "tenant_id" {
  type    = string
  
}

variable "resource_group_name" {
  type    = string
  
}

variable "storage_account_name" {
  type    = string
  
}

variable "azurerm_key" {
  type    = string

}

variable "location" {
  type    = string
  
}

variable "acr_name" {
  type    = string
  
}

variable "storage_account_name_for_persistence" {
  type    = string
  
}

variable "mysql_sku_name" {
  type    = string
}

variable "mysql_server_name" {
  type = string
  
}

variable "mysql_username" {
  type    = string
  
}

variable "mysql_password" {
  type    = string
  
}

variable "mysql_storage_mb" {
  type    = number
  
}

variable "mysql_version" {
  type    = string

}

variable "mysql_backup_retention_days" {
  type    = number
  
}

variable "mysql_infrastructure_encryption_enabled" {
  type    = bool
  default = false
}

variable "mysql_public_network_access_enabled" {
  type    = bool
  default = true
}

variable "mysql_ssl_enforcement_enabled" {
  type    = bool
  default = false
}


variable "mysql_ssl_minimal_tls_version_enforced" {
  type    = string
  default = "TLSEnforcementDisabled"
}

variable "mysql_firewall_rules" {
  type = map(object({
    name             = string
    start_ip_address = string
    end_ip_address   = string
  }))
}

variable "app_service_plan_name" {
  type    = string
}


variable "app_name" {
  type    = string
}

variable "stac_webapp_name" {
  type    = string
}

variable "docker_image_name" {
  type    = string
}

variable "docker_image_tag_name" {
  type    = string
}

variable "DRUPAL_SITE_NAME" {
  type    = string
}
variable "DOCKER_REGISTRY_SERVER_URL" {
  type    = string
}
variable "DOCKER_REGISTRY_SERVER_USERNAME" {
  type    = string
}
variable "DOCKER_REGISTRY_SERVER_PASSWORD" {
  type    = string
}

variable "SERVERALIAS" {
  type    = string
}
variable "SERVERNAME" {
  type    = string
}
variable "WEBSITES_PORT" {
  type    = string
}
variable "DOCUMENTROOT" {
  type    = string
}
variable "share_name" {
  type    = string
}

variable "mount_path" {
  type    = string
}

variable "nameshare" {
  type    = string
}


variable "resource_group_id" {
  type = string
  
}

variable "vnet_name" {
  type = string
  
}

variable "vnet_address_space" {
  type = list(string)
  
}

variable "web_subnet_name" {
  type = string
  
}

variable "azurerm_subnet_name" {
  type = string
  
}

variable "azurerm_subnet_address_prefixes" {
  type = list(string)
  
}