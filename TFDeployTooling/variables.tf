# Keyvault Variables

variable "vaultname" {
  default = "huskyvault"
}

variable "ssh_public_key" {
  
}


# Base Variables 

variable "rg_name" {
}

variable "rg_location" {
}

variable "tenant_id" {
}

variable "subscription_id" {
}

variable "tags" {
  description = "ARM resource tags to any resource types which accept tags"
  type        = map(string)
}






