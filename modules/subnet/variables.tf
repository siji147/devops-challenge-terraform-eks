variable "vpc_id" {
  type = string
}

variable "public_subnet_prefix" {
  description = "cidr blocks for the subnets"
  default     = ["10.1.1.0/24", "10.1.2.0/24"]
  type        = list(any)
}

variable "private_subnet_prefix" {
  description = "cidr blocks for the subnets"
  default     = ["10.1.3.0/24", "10.1.4.0/24"]
  type        = list(any)
}

variable "subnet_suffix" {
  type    = list(any)
  default = ["1", "2"]

}

variable "availability_zones" {
  type    = list(any)
  default = ["us-west-2a", "us-west-2b"]
}

variable "route_table_id" {
  type = string
}
