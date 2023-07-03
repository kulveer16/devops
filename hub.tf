#creating the hub vnet

resource "azurerm_virtual_network" "hub" {
  #count = var.hub_tobe_created ? 1 : 0  
  name     = "${var.tags["project"]}-${var.customer}-${var.hub_vnet_name}-${var.tags["environment"]}-${var.location}"
  address_space       = [var.hub_address]
  location            = var.location
  resource_group_name = azurerm_resource_group.hub_spoke.name
  tags = var.tags
}

# creating peering from hub to spoke vnets

resource "azurerm_virtual_network_peering" "hub_spoke_peering" {
    count = length(var.spokevnet_name)
  name     = "${var.tags["project"]}-${var.customer}-${var.peering_names[count.index]}-${var.tags["environment"]}-${var.location}"
  resource_group_name       = azurerm_resource_group.hub_spoke.name
  virtual_network_name      = azurerm_virtual_network.hub.name
  remote_virtual_network_id = azurerm_virtual_network.spoke[count.index].id

  allow_virtual_network_access = true
  allow_forwarded_traffic = true
  
}

#creating peering from spoke to hub vnets
resource "azurerm_virtual_network_peering" "spoke_hub_peering" {
    count = length(var.spokevnet_name)
  name     = "${var.tags["project"]}-${var.customer}-${var.peering_names[count.index]}-${var.tags["environment"]}-${var.location}"
  resource_group_name       = azurerm_resource_group.hub_spoke.name
  virtual_network_name      = azurerm_virtual_network.spoke[count.index].name
  remote_virtual_network_id = azurerm_virtual_network.hub.id

  allow_virtual_network_access = true
  allow_forwarded_traffic = true
}