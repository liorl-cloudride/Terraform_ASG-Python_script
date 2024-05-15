######## ROOT ########
region  = "us-east-2" #"eu-central-1"
profile = "flight-tlv"

######## ASG ########
name_prefix             = "lt-squadsim-terraform"
image_id                = "ami-0c2710a6f5162ec60"
instance_type           = "g4dn.xlarge"
subnet_id               = "subnet-0b3dd78fa24599019"
security_groups         = ["sg-05783cd1b463894bf"]
resource_type           = "instance"
resource_type_tag_name  = "Instance-squadsim"
autoscaling_group_name  = "Terraform_ASG"
launch_template_version = "$Latest"
min_size                = 0
max_size                = 2
desired_capacity        = 0
vpc_zone_identifier     = ["subnet-0b3dd78fa24599019"]


# name_prefix             = "lt-squadsim-"
# image_id                = "ami-08648752eeffb6182"    #flight-tlv ami ---> "ami-0c2710a6f5162ec60"
# instance_type           = "t2.micro"                 #filght-tlv instance type --->"g4dn.xlarge"
# subnet_id               = "subnet-0e73b4d16a1e030b8" # filght-tlv subnet ---> "subnet-0b3dd78fa24599019"
# security_groups         = ["sg-06b470074a34557fb"]   # flight-tlv sg ---> ["sg-05783cd1b463894bf"]
# resource_type           = "instance"
# resource_type_tag_name  = "Instance-squadsim"
# autoscaling_group_name  = "Terraform_ASG"
# launch_template_version = "$Latest"
# min_size                = 0
# max_size                = 2
# desired_capacity        = 0
# vpc_zone_identifier     = ["subnet-0e73b4d16a1e030b8"] # filght-tlv subnet ---> ["subnet-0b3dd78fa24599019"]