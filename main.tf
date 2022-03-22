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

# Use the eks module to deploy EKS cluster
module "eks_module" {
  source         = "./modules/eks"
  subnet_ids         = "${concat(module.subnet_module.public_subnets[*].id, module.subnet_module.private_subnets[*].id)}"
}

