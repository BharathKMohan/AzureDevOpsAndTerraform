provider "azurerm" {
  version = "2.19.0"
  features {}
}

resource "azurerm_resource_group" "tf_test" {
    name = "tfmainrg"
    location = "East US"
}

resource "azurerm_container_group" "tfcg_test" {
    name                = "weatherapi"
    location            = azurerm_resource_group.tf_test.location
    resource_group_name = azurerm_resource_group.name

    ip_address_type     = "public"
    dns_name_label      = "bharathkmohanapitf"
    os_type             = "Windows"

    container {
      name              = "weatherapi"   
      image             = "bharathkmohan/weatherapi" 
      cpu               = "1"
      memory            = "1"

      ports {
        port            = 80
        protocol        = "TCP"
      }
    }
}