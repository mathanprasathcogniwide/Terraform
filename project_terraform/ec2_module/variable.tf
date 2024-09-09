variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID for the EC2 instance"
  type        = string
}

variable "tags" {
  description = "Tags to assign to the EC2 instance"
  type        = map(string)
}

variable "key_name" {
  description = "The name of the key pair to use for SSH access"
  type        = string
  default     = ""
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with the EC2 instance"
  type        = bool
}

variable "vpc_security_ids" {
  description = "Security group IDs to associate with the EC2 instance"
  type        = list(string)
}

variable "enable_file_provisioner" {
  description = "Whether to enable file provisioner"
  type        = bool
  default     = false
}

variable "file_provisioner_source" {
  description = "Path to the file to be copied"
  type        = string
  default = ""
}

variable "file_provisioner_destination" {
  description = "Destination path on the instance"
  type        = string
  default = ""
}

variable "private_key_path" {
  description = "Path to the SSH private key"
  type        = string
  default = ""
}

variable "user_data" {
  description = "Optional user data to configure the EC2 instance"
  type        = string
  default     = ""  
}
