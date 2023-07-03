variable "resource-group" {
  default = ""
  description = "resource value"
  }
variable "location"{
    default = ""
    description = "location of the resource"
}  

variable "hub_vnet_name" {
  default = ""
  description = "name for the hubvnet"
}
variable "hub_address" {
  default = ""
  description = "address_space for the hubvnet"
}
variable "hub_tobe_created" {
    description = "true if you want to create hub_vnet"
}
variable "spoke_tobe_created" {
    description = "true if you want to create spoke_vnet"
}
variable "firewall_tobe_created" {
  description = "true if you want to create the firewall"
}
variable "spokevnet_count" {
  description = "Number of virtual networks to create."
  type        = number
  default     = 2
}

variable "spokesubnet_count" {
    type = number
    description = "number of subnets for each spokevnet"
  
}

variable "spokevnet_name" {
  description = "The name of the virtual network."
  type        = list(string)
}

variable "spokevnet_address_space"{
    description = " addess spaces for spoke_vnet"
    type = list(string)
}

variable "spokesubnet_name" {
  type = list(string)
}

variable "spokesubnet_address_prefix" {
  type = list(string)
}

variable "peering_names" {
    type = list(string)
  
}

variable "firewall_subnet_name" {
  default = "AzureFirewallSubnet"
}

variable "firewall_address" {
  default = ""
  description = "address_space for the hubvnet firewall"
}

variable "firewall_name" {
  default = ""
}
variable "firewall_ip_name" {
  default = ""
}

variable "ntc_rule_name" {
  default = ""
}


variable "Env" {
  default = ""
}

variable "tags" {
  type    = map(string)
  default = {}
}
variable "customer" {
  default= ""
}
variable "nat_ip" {
  default = ""
}
variable "nat-gw" {
  default = ""
}
variable "route_table" {
  default = ""
}
