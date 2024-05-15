variable "region" {
  type        = string
  description = "AWS region"
}

variable "profile" {
  type        = string
  description = "Configuration and credentials profile on local machine"
}
variable "name_prefix" {
  type        = string
  description = "Creates a unique name beginning with the specified prefix."
}

variable "image_id" {
  type        = string
  description = "The AMI from which to launch the instance."
}

variable "instance_type" {
  type        = string
  description = "The type of the instance"
}

variable "subnet_id" {
  type        = string
  description = "The VPC Subnet ID to associate."
}

variable "security_groups" {
  type        = list(string)
  description = "A list of security group IDs to associate"
}

variable "resource_type" {
  type        = string
  description = "The type of resource to tag."
}

variable "resource_type_tag_name" {
  type        = string
  description = "Key Value for a tag"
}

variable "autoscaling_group_name" {
  type = string
  description = "Autoscaling group name"
}

variable "launch_template_version" {
  type        = string
  description = "Template version. Can be version number, $Latest, or $Default"
}

variable "min_size" {
  type        = number
  description = "The minimum size of the Auto Scaling Group."
}

variable "max_size" {
  type        = number
  description = "The maximum size of the Auto Scaling Group."
}

variable "desired_capacity" {
  type        = number
  description = "The desired number of instances in the Auto Scaling Group."
}

variable "vpc_zone_identifier" {
  type        = list(string)
  description = "A list of subnet IDs to launch resources in."
}
