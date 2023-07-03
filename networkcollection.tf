resource "azurerm_firewall_network_rule_collection" "ntcrule" {
  name     = "${var.tags["project"]}-${var.customer}-${var.ntc_rule_name}-${var.tags["environment"]}-${var.location}"
  
  azure_firewall_name = azurerm_firewall.firewall.name
  resource_group_name = azurerm_resource_group.hub_spoke.name
  priority            = 100
  action              = "Allow"

  rule {
    name = "transitive"

    source_addresses = [
      "*"
    ]

    destination_ports = [
      "*"
    ]

    destination_addresses = [
      "*"
    ]

    protocols = [
      "Any"
    ]
  }
}