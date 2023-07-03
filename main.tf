resource "azurerm_resource_group" "hub_spoke" {
  name     = "${var.tags["project"]}-${var.customer}-${var.resource-group}-${var.tags["environment"]}-${var.location}"
  location = var.location

}
