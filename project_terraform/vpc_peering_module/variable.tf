variable "vpc_id" {
  description = "The ID of the VPC to create the peering connection from"
  type        = string
}

variable "peer_vpc_id" {
  description = "The ID of the VPC to create the peering connection to"
  type        = string
}

variable "auto_accept" {
  description = "Whether to automatically accept the peering connection"
  type        = bool
  default     = false
}

variable "route_table_id_network_a" {
  description = "The ID of the route table in VPC A"
  type        = string
}

variable "route_table_id_network_b" {
  description = "The ID of the route table in VPC B"
  type        = string
}

variable "peer_cidr_block" {
  description = "The CIDR block of the peer VPC"
  type        = string
}

variable "vpc_cidr_block" {
  description = "The CIDR block of the local VPC"
  type        = string
}
