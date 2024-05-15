# list of machines (ec2) that are up
# region | instance type | external IP (Public)

import boto3

def list_ec2_instances() -> None:
    session = boto3.Session(profile_name='flight-tlv')

    # ec2_client = session.client('ec2')
    # print(ec2_client.describe_regions()['Regions'])
    # regions = [region['RegionName'] for region in ec2_client.describe_regions()['Regions']]
    # print(regions)
    with open('regions.txt', 'r') as file:
        regions = [line.strip() for line in file.readlines()]
    # try:
    #     with open('regions.txt', 'r') as file:
    #         regions = [line.strip() for line in file if line.strip()]  # Ensure we ignore empty lines
    #     # If the file is empty, fetch all regions
    #     if not regions:
    #         ec2_client = session.client('ec2')
    #         regions = [region['RegionName'] for region in ec2_client.describe_regions()['Regions']]
    #         print(regions)
    # except FileNotFoundError:
    #     # If the file does not exist, fetch all regions
    #     print("regions.txt file not found. Using all available regions.")
    #     ec2_client = session.client('ec2')
    #     regions = [region['RegionName'] for region in ec2_client.describe_regions()['Regions']]
    #     print(regions)
        
    all_instances = []

    for region in regions:
        print(f"Checking EC2 instances in region: {region}")
        region_client = session.client('ec2', region_name=region)
        print("check")
        response = region_client.describe_instances(
            Filters=[
                {
                    'Name': 'instance-state-name',
                    'Values': [
                        'stopped'
                    ]
                }
            ]
        )
        print("check2")

        # print(response)

        for reservation in response['Reservations']:
            for instance in reservation['Instances']:
                instance_details = {
                    'Region': region,
                    'Instance Type': instance.get('InstanceType'),
                    'External IP (Public)': instance.get('PublicIpAddress', "None")
                }
                all_instances.append(instance_details)
                # print(all_instances)

    print("\nList of running EC2 instances:")
    print("Region | Instance Type | External IP")
    for instance in all_instances:
        print(f"{instance['Region']} | {instance['Instance Type']} | {instance['External IP (Public)']}")

if __name__ == '__main__':
    list_ec2_instances()