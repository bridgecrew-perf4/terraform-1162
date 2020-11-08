variable "aws_region" {
  type = string
}

variable "sg_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "cidr_blocks_1" {
  type = list(string)
}

variable "cidr_blocks_2" {
  type = list(string)
}

variable "identifier" {
  type = string
}

variable "storage" {
  type = string
}

variable "storage_encrypted" {
  type = string
}

variable "multi_az" {
  type = string
}

variable "engine" {
  type = string
}

variable "engine_version" {
  type = string
}

variable "instance_class" {
  type = string
}

variable "db_name" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}

variable "port" {
  type = string
}

#variable "multi_az" {
#  type = string
#}

#variable "subnet_ids" {
#  type = list(string)
#}

variable "main_subnet_group" {
  type = string
}
