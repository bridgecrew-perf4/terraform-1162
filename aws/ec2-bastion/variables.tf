variable "region" {
	type = string
}

variable "sg_name" {
	type = string
}

variable "cidr_blocks" {
	type = list(string)
}

variable "vpc_id" {
	type = string
}

variable "subnet_id" {
	type = string 
}

variable "ec2_name" {
	type = string
}

variable "instance_type" {
	type = string
}

variable "ec2_tag_name" {
	type = string
}

variable "ami" {
	type = string
}

variable "key_name" {
	type = string
}