resource "azurerm_subnet" "firewall" {
   # count = var.firewall_tobe_created ? 1 : 0
  name     = "${var.tags["project"]}-${var.customer}-${var.firewall_subnet_name}-${var.tags["environment"]}-${var.location}"
  resource_group_name  = azurerm_resource_group.hub_spoke.name
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefixes     = [var.firewall_address]
}

resource "azurerm_public_ip" "firewall_ip" {
  name     = "${var.tags["project"]}-${var.customer}-${var.firewall_ip_name}-${var.tags["environment"]}-${var.location}"
  location            = azurerm_resource_group.hub_spoke.location
  resource_group_name = azurerm_resource_group.hub_spoke.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall" "firewall" {
  
  name     = "${var.tags["project"]}-${var.customer}-${var.firewall_name}-${var.tags["environment"]}-${var.location}"
  location            = azurerm_resource_group.hub_spoke.location
  resource_group_name = azurerm_resource_group.hub_spoke.name
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.firewall.id
    public_ip_address_id = azurerm_public_ip.firewall_ip.id


  }
}

