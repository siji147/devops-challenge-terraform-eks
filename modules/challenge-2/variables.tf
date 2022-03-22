variable "public_subnet_prefix" {
    description = "cidr blocks for the subnets"
    default = ["10.1.1.0/24", "10.1.2.0/24"]
    type = list  
}

variable "private_subnet_prefix" {
    description = "cidr blocks for the subnets"
    default = ["10.1.3.0/24", "10.1.4.0/24"]
    type = list
}

variable "subnet_suffix" {
    type = list
    default = ["1", "2"]
  
}

variable "availability_zones" {
    type = list
    default = ["us-west-2a" , "us-west-2b"]
  
}
