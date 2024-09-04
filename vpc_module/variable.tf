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
