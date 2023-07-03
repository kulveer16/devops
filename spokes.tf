#creating the spoke vnet

resource "azurerm_virtual_network" "spoke" {
  count = var.spoke_tobe_created ? var.spokevnet_count : 0
  name     = "${var.tags["project"]}-${var.customer}-${var.spokevnet_name[count.index]}-${var.tags["environment"]}-${var.location}"
  address_space       = [var.spokevnet_address_space[count.index]]
  location            = var.location
  resource_group_name = azurerm_resource_group.hub_spoke.name
  tags = var.tags
}

#creating the subnets



resource "azurerm_subnet" "spoke_subnet" {
  count = length(var.spokesubnet_name)
  name     = "${var.tags["project"]}-${var.customer}-${var.spokesubnet_name[count.index]}-${var.tags["environment"]}-${var.location}"
  resource_group_name  = azurerm_resource_group.hub_spoke.name
  virtual_network_name = azurerm_virtual_network.spoke[floor(count.index / var.spokesubnet_count)].name
  address_prefixes     = [var.spokesubnet_address_prefix[count.index]]
}
