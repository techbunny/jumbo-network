### DEPLOYMENT NOTE ###
# This tooling should be deployed before the VMS and networking,
# as it contains the keyvault and logic processing for the VMBlaster software.

module "resourcegroup" {
  source = "../TFmodules/resource-group"
  
    name     = var.rg_name
    location = var.rg_location
    tags     = var.tags

}

# Key Vault

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "huskyvault" {
  name                        = var.vaultname
  location                    = var.rg_location
  resource_group_name         = var.rg_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_enabled         = true
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    certificate_permissions = [
      "managecontacts",
    ]

    key_permissions = [
      "get",
      "list",
      "create",
      "delete",
      "purge",
    ]

    secret_permissions = [
      "get",
      "list",
      "set",
    ]

    storage_permissions = [
      "get",
    ]
  }

  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
    ip_rules       = ["67.180.178.209/32"]
  }


  contact {
    email = "jcroth@microsoft.com"
    name  = "Jennelle Crothers"
    phone = "0123456789"
  }
  
  tags = var.tags

}

resource "azurerm_key_vault_secret" "pubkey" {
  name         = "pubkey"
  value        = var.ssh_public_key
  key_vault_id = azurerm_key_vault.huskyvault.id
}




