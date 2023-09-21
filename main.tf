#ACR Module

module "scafe_acr" {
  source  = "scalesafely/acr/azure"

  #Variables
  resource_group_name   = var.resource_group_name
  location              = var.location
  acr_name              = var.acr_name   
  subnet_id             = module.scafe_virtual_network.subnet_id
}

#Storage Module
module "scafe_storage_module" {
  source = "scalesafely/storage/azure"

  #Variables
  resource_group_name      = var.resource_group_name
  location                 = var.location
  storage_account_name     = var.storage_account_name_for_persistence
}

#Virtual Network Module
module "scafe_virtual_network" {
  source  = "scalesafely/network_webapp/azure"
    #Variables
  resource_group_name = var.resource_group_name
  location                        = var.location
  vnet_name                       = var.vnet_name
  vnet_address_space              = var.vnet_address_space
  web_subnet_name                 = var.web_subnet_name
  web_address_subnet_prefixes     = var.web_address_subnet_prefixes
  azurerm_subnet_address_prefixes = var.azurerm_subnet_address_prefixes

}

#Scafe MySQL Module
module "scafe_mysql" {
  source = "scalesafely/mysql/azure"
  
  #Variables
  mysql_server_name                       = var.mysql_server_name
  resource_group_name                     = var.resource_group_name
  location                                = var.location
  mysql_sku_name                          = var.mysql_sku_name
  mysql_username                          = var.mysql_username
  mysql_password                          = var.mysql_password
  mysql_storage_mb                        = var.mysql_storage_mb
  mysql_version                           = var.mysql_version
  mysql_backup_retention_days             = var.mysql_backup_retention_days
  mysql_infrastructure_encryption_enabled = var.mysql_infrastructure_encryption_enabled
  mysql_public_network_access_enabled     = var.mysql_public_network_access_enabled
  mysql_ssl_enforcement_enabled           = var.mysql_ssl_enforcement_enabled
  mysql_ssl_minimal_tls_version_enforced  = var.mysql_ssl_minimal_tls_version_enforced
  mysql_firewall_rules                    = var.mysql_firewall_rules
}

#Scafe WebApp Module
module "AppService" {
  source  = "scalesafely/AppService/azrue"

  #Variables
  resource_group_name                     = var.resource_group_name
  location                                = var.location
  mysql_resource_id                       = module.scafe_mysql.mysql_resource_id
  app_name                                = var.app_name
  app_service_plan_name                   = var.app_service_plan_name
  stac_webapp_name                        = var.stac_webapp_name
  docker_image_name                       = var.docker_image_name
  docker_image_tag_name                   = var.docker_image_tag_name
  DRUPAL_SITE_NAME                        = var.DRUPAL_SITE_NAME
  DOCKER_REGISTRY_SERVER_URL              = var.DOCKER_REGISTRY_SERVER_URL
  DOCKER_REGISTRY_SERVER_USERNAME         = var.DOCKER_REGISTRY_SERVER_USERNAME
  DOCKER_REGISTRY_SERVER_PASSWORD         = var.DOCKER_REGISTRY_SERVER_PASSWORD
  SERVERALIAS                             = var.SERVERALIAS
  SERVERNAME                              = var.SERVERNAME
  WEBSITES_PORT                           = var.WEBSITES_PORT
  DOCUMENTROOT                            = var.DOCUMENTROOT
  share_name                              = var.share_name
  mount_path                              = var.mount_path
  nameshare                               = var.nameshare

  web_subnet_id                           = module.scafe_virtual_network.web_subnet_id
  acr_resource_id                         = module.scafe_acr.acr_resource_id
  resource_group_id                       =  var.resource_group_id
  }



  