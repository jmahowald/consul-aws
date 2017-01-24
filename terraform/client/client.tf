

variable "min_size" { 
 default = "3" 
}
variable "max_size" { 
 default = "5" 
}
variable "key_name" { 
    description= "key used to provision instances"
}
variable "zone_name" {
 description = "Hosted zone name that you control in route 53" 
}
variable "consul_fqdn" { 
 description = "logical name for the alb to the consul http api.  Should have same suffix as zone name"
}





module "consul" {
  source = "git::ssh://git@git.genesyslab.com/web-service-discovery//terraform"
  subnet_ids = "${data.terraform_remote_state.vpc_layer.public_subnet_ids}"
  security_group_ids = "${data.terraform_remote_state.vpc_layer.public_sg_id}"
  min_size = "${var.min_size}"
  max_size = "${var.max_size}"
  key_name = "${var.key_name}"
  zone_name = "${var.zone_name}"
  consul_fqdn = "${var.consul_fqdn}"
}


output "consul_fqdn" {
  value = "${module.consul.consul_fqdn}"
} 







