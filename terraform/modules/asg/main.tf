resource "aws_launch_template" "asg_launch_template" {
  name_prefix   = var.name_prefix
  image_id      = var.image_id
  instance_type = var.instance_type

  network_interfaces {
    associate_public_ip_address = true
    subnet_id                   = var.subnet_id
    security_groups             = var.security_groups
  }

  tag_specifications {
    resource_type = var.resource_type
    tags = {
      Name = var.resource_type_tag_name
    }
  }
}

resource "aws_autoscaling_group" "asg" {
  name = var.autoscaling_group_name
  launch_template {
    id      = aws_launch_template.asg_launch_template.id
    version = var.launch_template_version
  }

  min_size            = var.min_size
  max_size            = var.max_size
  desired_capacity    = var.desired_capacity
  vpc_zone_identifier = var.vpc_zone_identifier

  tag {
    key                 = "Name"
    value               = "ASG-instances"
    propagate_at_launch = true
  }

  tag {
    key                 = "Managed_by"
    value               = "Terraform"
    propagate_at_launch = true
  }

  tag {
    key                 = "Owner"
    value               = "Cloudride"
    propagate_at_launch = true
  }
}
