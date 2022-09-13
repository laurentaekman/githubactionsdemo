terraform {
    required_version = ">=0.12"
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = ">=2.0"
        }
    }
}

provider "azurerm" {
    features {}
}

variable "rg_prefix" {
    default = "rg"
}

variable "location" {
    default = "eastus"
}

resource "random_pet" "gh-actions-resource" {
    prefix = var.rg_prefix
}

resource "azurerm_resource_group" "gh-actions-resource-group" {
    location = var.location
    name = random_pet.gh-actions-resource.id
}

output "resource_group_location" {
    value = azurerm_resource_group.gh-actions-resource-group.name
}