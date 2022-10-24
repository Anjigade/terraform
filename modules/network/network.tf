resource "azurerm_resource_group" "res_grp_tf" {
    name = var.resource_group_name
    location = var.region

  
}
resource "azurerm_virtual_network" "vnet1" {
    name = var.vn_var
    location = var.region
    resource_group_name = var.resource_group_name
    address_space = var.vnettf_addr
    depends_on = [
      azurerm_resource_group.res_grp_tf
    ]
  
}
resource "azurerm_subnet" "azsubnet" {
    count = length(var.subnet_tag)
    name = var.subnet_tag[count.index]
    resource_group_name = var.resource_group_name
    virtual_network_name = var.vn_var
    #address_prefixes = var.addr_prefx[count.index]
    #address_prefixes = [var.addr_prefx[count.index]]
    address_prefixes = [cidrsubnet(var.vnettf_addr[0],8,count.index)]
       depends_on = [
      azurerm_resource_group.res_grp_tf,
      azurerm_virtual_network.vnet1
    ]
  
}