module "vpc" {
  version = "5.13.0"
  source = "terraform-aws-modules/vpc/aws"
  name = "${local.env}-${local.project}-vpc"
  cidr = local.vpc-block
  instance_tenancy = "default"
  azs                  = ["us-east-1a", "us-east-1b", "us-east-1c"]
  default_network_acl_ingress    =  local.default_network_acl_ingress
  default_network_acl_egress     =  local.default_network_acl_egress
  manage_default_network_acl = true
  private_subnets      = local.private-subnets
  public_subnets       = local.public-subnets
  private_subnet_names = ["${local.env}-${local.project}-private-subnet-1a","${local.env}-${local.project}-private-subnet-1b","${local.env}-${local.project}-private-subnet-1c"]
  public_subnet_names  = ["${local.env}-${local.project}-public-subnet-1a","${local.env}-${local.project}-public-subnet-1b","${local.env}-${local.project}-public-subnet-1c"]
  create_igw           = true
  enable_dns_hostnames = true
  enable_dns_support   = true
  enable_dhcp_options  = true
  dhcp_options_domain_name_servers = ["AmazonProvidedDNS"]
  dhcp_options_domain_name = local.domain
  enable_nat_gateway   = true
  enable_vpn_gateway   = false
  single_nat_gateway   = true
  #tags                 = ({ "Name" = join("-", [local.env, local.project]) })
  default_network_acl_tags = ({ "Name" = join("-", [local.env, local.project, "nacl"]) })
  vpc_tags             = ({ "Name" = join("-", [local.env, local.project, "vpc"]) })
  private_route_table_tags = ({"Name" = join("-",[local.env,local.project,"private-rt"])})
  public_route_table_tags = ({"Name" = join("-",[local.env,local.project,"public-rt"])})
  igw_tags  = ({ "Name" = join("-", [local.env, local.project, "igw"]) })
  nat_gateway_tags = ({ "Name" = join("-", [local.env, local.project, "natgateway"]) })
}