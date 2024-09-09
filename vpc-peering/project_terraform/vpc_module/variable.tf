variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "subnets" {
  description = "Map of subnets with keys for subnet names and values containing cidr_block, az, and type (public or private)"
  type = map(object({
    cidr_block = string
    az         = string
    type       = string
  }))
}

variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
}

variable "create_igw" {
  description = "Whether to create an Internet Gateway"
  type        = bool
  default     = true
}

variable "create_public_route_table" {
  description = "Whether to create a public route table"
  type        = bool
  default     = true
}

variable "network_name" {
  description = "The name of the network"
  type        = string
}

variable "create_public_route" {
  description = "Whether to create a route for internet traffic"
  type        = bool
  default     = true
}

variable "associate_public_subnets" {
  description = "Whether to associate public subnets with the route table"
  type        = bool
  default     = true
}

variable "create_nat_eip" {
  description = "Whether to create an Elastic IP for the NAT Gateway"
  type        = bool
  default     = false
}

variable "create_nat_gateway" {
  description = "Whether to create a NAT Gateway for private subnets"
  type        = bool
  default     = true
}

variable "nat_gateway_subnet_name" {
  description = "The name of the public subnet for the NAT Gateway"
  type        = string
}

variable "create_private_route_table" {
  description = "Whether to create a private route table"
  type        = bool
  default     = true
}

variable "create_private_route" {
  description = "Whether to create a private route for internet traffic through NAT Gateway"
  type        = bool
  default     = true
}

variable "associate_private_subnets" {
  description = "Whether to associate private subnets with the private route table"
  type        = bool
  default     = true
}
