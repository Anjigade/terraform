module "network" {
    source = "./modules/network"
    #version = "1.0.0.0"
    region = "eastus"
    vn_var = "vnet_creation"
    resource_group_name = "resgrp_module_creation"
    vnettf_addr = ["10.10.0.0/16"]
    #addr_prefx = ["192.168.0.0/24","192.168.1.0/24","192.168.2.0/24","192.168.3.0/24"]
    subnet_tag = ["web2","app2","db2","admin2"]
  
}