locals {
  env = terraform.workspace
  tf_project_name = {
    staging = "test"
  }
  project = local.tf_project_name[local.env]

default_network_acl_ingress = [

      {
        protocol   = "tcp"
        rule_no    = 110
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 443
        to_port    = 443
      }
    ]
default_network_acl_egress = [

      {
        protocol   = "tcp"
        rule_no    = 110
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 443
        to_port    = 443
      }
    ]
  tf_vpc-block = {
    staging = "172.16.0.0/16"
  }
  vpc-block = local.tf_vpc-block[local.env]

  tf_private-subnets = {
    staging = ["172.16.1.0/24","172.16.2.0/24","172.16.3.0/24"]
  }
  private-subnets = local.tf_private-subnets[local.env]

  tf_public-subnets = {
    staging = ["172.16.4.0/24","172.16.5.0/24","172.16.6.0/24"]
  }
  public-subnets = local.tf_public-subnets[local.env]

  tf_domain = {
    staging = "test.example.local"
  }
  domain  = local.tf_domain[local.env]
}