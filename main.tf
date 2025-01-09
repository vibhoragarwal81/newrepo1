terraform {
  required_version = "~>1.10.3"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.43.0"
    }
  }
  cloud {
    organization = "Vibhororg1"
    workspaces {
      name = "terraformci2"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "1-6301683e-playground-sandbox"
  location = "East US"
}

resource "azurerm_storage_account" "storage01082025" {
  name                     = "storage01082025gitb"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "RAGRS"
  resource_group_name      = azurerm_resource_group.rg.name
}
