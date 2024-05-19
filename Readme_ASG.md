# AWS Auto Scaling Group with Launch Template

This Terraform module provisions an AWS Auto Scaling Group (ASG) utilizing a Launch Template.

## Prerequisites

Before you begin, ensure you have the following prerequisites installed:

- Terraform/openTofu
- AWS CLI, configured with Administrator access

## Configuration

### Variables

This module uses various variables to allow customization according to your requirements:

- `name_prefix`: Prefix for the launch template name to ensure uniqueness.
- `image_id`: ID of the AMI to be used for the instances.
- `instance_type`: Type of the instance (e.g., `t2.micro`, `m5.large`).
- `subnet_id`: Subnet ID where the instances should be launched.
- `security_groups`: List of security group IDs to attach to the instance network interface.
- `min_size`: Minimum number of instances in the ASG.
- `max_size`: Maximum number of instances in the ASG.
- `desired_capacity`: Desired number of instances the ASG should maintain.
- `vpc_zone_identifier`: List of subnet IDs for the ASG placement.

### Resources Created

- **AWS Launch Template**: Defines the configuration of instances to be launched.
- **AWS Auto Scaling Group**: Manages the auto-scaling of instances based on the defined launch template.

##### `flight-tlv.tfvars` file contains entries for all the variables that the module expects.

## Usage
```
tofu init
tofu plan -var-file="path/to/flight-tlv.tfvars" (if want to watch the plan)
tofu apply -var-file="path/to/flight-tlv.tfvars" (create the infrastructure)
```