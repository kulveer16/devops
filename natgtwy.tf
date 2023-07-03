resource "azurerm_public_ip" "nat_ip" {
  name     = "${var.tags["project"]}-${var.customer}-${var.nat_ip}-${var.tags["environment"]}-${var.location}"
  location            = var.location
  resource_group_name = azurerm_resource_group.hub_spoke.name
  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = ["1"]
}

resource "azurerm_nat_gateway" "nat-gw" {
  name     = "${var.tags["project"]}-${var.customer}-${var.nat_gw}-${var.tags["environment"]}-${var.location}"
  location                = var.location
  resource_group_name     = azurerm_resource_group.hub_spoke.name
  sku_name                = "Standard"
  idle_timeout_in_minutes = 10
  zones                   = ["1"]
}

resource "azurerm_nat_gateway_public_ip_association" "nat-ip-associate" {
  nat_gateway_id       = azurerm_nat_gateway.nat-gw.id
  public_ip_address_id = azurerm_public_ip.nat_ip.id
}

resource "azurerm_subnet_nat_gateway_association" "nat-firewall" {
  subnet_id      = azurerm_subnet.firewall.id
  nat_gateway_id = azurerm_nat_gateway.nat-gw.id
}