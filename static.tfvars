
  resource-group = "rg"
  location = "West Europe"
  hub_tobe_created = true 
  hub_vnet_name = "hub"
  hub_address = "10.0.0.0/16"
  spoke_tobe_created = true
  spokevnet_count = 2
  spokesubnet_count = 2
  spokevnet_name = [ "spoke1", "spoke2" ]
  spokevnet_address_space = [ "10.1.0.0/16","10.2.0.0/16" ]
  spokesubnet_name = ["spoke1-subnetA","spoke1-subnetB","spoke2-subnetA","spoke2-subnetB"]
  spokesubnet_address_prefix = ["10.1.1.0/24","10.1.2.0/24","10.2.1.0/24","10.2.2.0/24"]
  peering_names = [ "hsp1","hsp2" ]
  firewall_tobe_created = true
  firewall_address = "10.0.2.0/24"
  firewall_name = "hub_firewall"
  firewall_ip_name = "firewall_ip"
  ntc_rule_name = "transistive_rule"
  nat_ip = "nat-ip"
  customer = "xyz"
  nat-gw = "nat-gw"
  route_table = "route-to-hub"
  tags = {
    Environment = "__environment__"
    Project     = "__project__"
    owner = "MOtivity"
    createdby = "EA"
    
  }