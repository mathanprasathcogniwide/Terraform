variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
}