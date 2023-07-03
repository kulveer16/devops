output "firewall_private_ip" {
  value = azurerm_firewall.firewall.ip_configuration[0].private_ip_address
}
output "vcp_hub_id" {
  value = azurerm_virtual_network.hub.id
}


 output "spokevnet_ids" {
  value = azurerm_virtual_network.spoke[*].id
}

output "resource_group_name" {
  value = azurerm_resource_group.hub_spoke.name
}
output "location" {
  value = azurerm_resource_group.hub_spoke.location
}
