module "asg" {
  source                  = "./modules/asg"
  name_prefix             = var.name_prefix
  image_id                = var.image_id
  instance_type           = var.instance_type
  subnet_id               = var.subnet_id
  security_groups         = var.security_groups
  resource_type           = var.resource_type
  resource_type_tag_name  = var.resource_type_tag_name
  autoscaling_group_name  = var.autoscaling_group_name
  launch_template_version = var.launch_template_version
  min_size                = var.min_size
  max_size                = var.max_size
  desired_capacity        = var.desired_capacity
  vpc_zone_identifier     = var.vpc_zone_identifier
}
