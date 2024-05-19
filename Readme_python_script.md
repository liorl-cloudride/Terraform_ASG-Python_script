# EC2 Instance Lister

This Python script lists the running of Amazon EC2 (Elastic Compute Cloud) instances across multiple regions. Each running instance displays the region, instance type, and public IP address (if available).
## Prerequisites

Before you run this script, you need to have:

- Python is installed on your system.
- `boto3` library installed. You can install it using pip:

```bash
pip3 install boto3
```

## Setup

1. **AWS Configuration**: Ensure AWS CLI is configured with the profile`<your-profile>`. You can set up a profile by running:

```
aws configure --profile <your-profile>
```

2. **Region File**: Create a file named `regions.txt` in the same directory as this script. Add the AWS regions you want to check, one per line. For example:

```
us-east-1
us-west-2
us-east-2
```

AWS regions availability:
https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html
###### Important notes:
- *The regions.txt file should be on the same path as your Python script.*
- *If regions.txt is empty or does not exist, the script will check in whole AWS regions.*
## Usage

To run the script, use the following command from the terminal:

```
python3 list_ec2_instances.py
```

The script will output the list of running EC2 instances in the specified regions, formatted like this:

```
List of running EC2 instances:
Region | Instance Type | External IP
us-east-1 | t2.micro | 54.212.34.89
us-east-2 | t2.micro | None
```