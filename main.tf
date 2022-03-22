provider "aws" {
  region = "us-west-2"
}

# Use the vpc module to deploy vpc
module "vpc_module" {
  source = "./modules/vpc"
}

# Use the subnet module to deploy subnets
module "subnet_module" {
  source         = "./modules/subnet"
  vpc_id         = module.vpc_module.vpc_id
  route_table_id = module.vpc_module.route_table_id
}



