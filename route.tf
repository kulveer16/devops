resource "azurerm_route_table" "route_to_hub" {
  #count          = var.spokevnet_count
  name     = "${var.tags["project"]}-${var.customer}-${var.route_table}-${var.tags["environment"]}-${var.location}"
  location       = azurerm_resource_group.hub_spoke.location
  resource_group_name = azurerm_resource_group.hub_spoke.name

  route {
    name                = "route"
    address_prefix      = "0.0.0.0/0"
    next_hop_type       = "VirtualAppliance"
    next_hop_in_ip_address = azurerm_firewall.firewall.ip_configuration[0].private_ip_address
  }
   tags = var.tags
}

resource "azurerm_subnet_route_table_association" "spoke_route_association" {
    count = var.spokesubnet_count*var.spokevnet_count
  subnet_id      = azurerm_subnet.spoke_subnet[count.index].id
  route_table_id = azurerm_route_table.route_to_hub.id
}