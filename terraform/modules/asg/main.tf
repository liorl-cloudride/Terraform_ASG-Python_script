resource "aws_launch_template" "asg_launch_template" {
  name_prefix   = "lt-squadsim-"
  image_id      = "ami-08648752eeffb6182"  #flight-tlv ami ---> "ami-0c2710a6f5162ec60"
  instance_type = "t2.micro"               #filght-tlv instance type --->"g4dn.xlarge"

  # block_device_mappings {
  #   device_name = "/dev/sda1"
  #   ebs {
  #     volume_size = 20
  #     volume_type = "gp3"
  #     delete_on_termination = true
  #   }
  # }

  vpc_security_group_ids =  ["sg-06b470074a34557fb"] # flight-tlv sg ---> ["sg-05783cd1b463894bf"]

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "Instance-squadsim-g4dn"
    }
  }

  tag_specifications {
    resource_type = "volume"
    tags = {
      Name = "Volume-squadsim-g4dn"
    }
  }
}

resource "aws_autoscaling_group" "asg" {
  launch_template {
    id      = aws_launch_template.asg_launch_template.id
    version = "$Latest"
  }

  min_size             = 0
  max_size             = 2
  desired_capacity     = 0
  vpc_zone_identifier  = ["subnet-0e73b4d16a1e030b8"] # filght-tlv subnet ---> ["subnet-0b3dd78fa24599019"]

  tag {
    key                 = "Name"
    value               = "ASG-g4dn-instances"
    propagate_at_launch = true
  }
}