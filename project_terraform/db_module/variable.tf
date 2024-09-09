variable "db_name" {
  description = "Name of the database"
  type        = string
}

variable "engine" {
  description = "Database engine"
  type        = string
}

variable "allocated_storage" {
  description = "Allocated storage size in GB"
  type        = number
}

variable "engine_version" {
  description = "Database engine version"
  type        = string
}

variable "instance_class" {
  description = "Instance class"
  type        = string
}

variable "username" {
  description = "Master username"
  type        = string
}

variable "password" {
  description = "Master password"
  type        = string
}

variable "publicly_accessible" {
  description = "Whether the database is publicly accessible"
  type        = bool
}

variable "tags" {
  description = "Tags to assign to the resources"
  type        = map(string)
}

variable "subnet_ids" {
  description = "List of subnet IDs for the DB subnet group"
  type        = list(string)
}

variable "subnet_group_name" {
  description = "The name of the DB subnet group"
  type        = string
}

variable "skip_final_snapshot" {
  type = bool
}

variable "vpc_security_group_ids" {
  type = list(string)
}