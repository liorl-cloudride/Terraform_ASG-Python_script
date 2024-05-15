# import boto3
# from botocore.exceptions import ClientError
# import datetime

# def list_ec2_instances():
#     session = boto3.Session(profile_name='flight-tlv')

#     try:
#         with open('regions.txt', 'r') as file:
#             regions = [line.strip() for line in file if line.strip()]
#     except FileNotFoundError:
#         print("regions.txt file not found. Querying all available regions.")
#         regions = None

#     if not regions:
#         ec2_client = session.client('ec2')
#         regions = [region['RegionName'] for region in ec2_client.describe_regions()['Regions']]
#         print("Regions to be queried:", regions)

#     all_instances = []

#     for region in regions:
#         print(f"Checking EC2 instances in region: {region}")
#         region_client = session.client('ec2', region_name=region)

#         try:
#             response = region_client.describe_instances(
#                 Filters=[{'Name': 'instance-state-name', 'Values': ['stopped']}]
#             )

#             for reservation in response['Reservations']:
#                 for instance in reservation['Instances']:
#                     instance_details = {
#                         'Region': region,
#                         'Instance Type': instance.get('InstanceType'),
#                         'External IP (Public)': instance.get('PublicIpAddress', "None")
#                     }
#                     all_instances.append(instance_details)
#         except ClientError as error:
#             print(error.response)
#             print(f"Failed to retrieve instances for {region}. Error: {error}")
#             if error.response['Error']['Code'] == "AuthFailure":
#                 print("Authentication failure. Possible issues with access in", region)
#                 try:
#                     print("Token details: Expiry:", session.get_credentials().expiration)
#                 except AttributeError:
#                     print("No expiration information available for credentials.")

#     print("\nList of running EC2 instances:")
#     print("Region | Instance Type | External IP")
#     for instance in all_instances:
#         print(f"{instance['Region']} | {instance['Instance Type']} | {instance['External IP (Public)']}")

# if __name__ == '__main__':
#     list_ec2_instances()

import boto3
from botocore.exceptions import ClientError
import datetime

def list_ec2_instances():
    session = boto3.Session(profile_name='flight-tlv')

    try:
        with open('regions.txt', 'r') as file:
            regions = [line.strip() for line in file if line.strip()]
    except FileNotFoundError:
        print("regions.txt file not found. Querying all regions where opt-in is not required.")
        regions = None

    if not regions:
        print("regions.txt file is empty. Querying all regions where opt-in is not required.")
        ec2_client = session.client('ec2')
        response = ec2_client.describe_regions(Filters=[
            {'Name': 'opt-in-status', 'Values': ['opt-in-not-required']}
        ])
        regions = [region['RegionName'] for region in response['Regions']]
        print("Regions to be queried:", regions)

    all_instances = []

    for region in regions:
        print(f"Checking EC2 instances in region: {region}")
        region_client = session.client('ec2', region_name=region)

        try:
            response = region_client.describe_instances(
                Filters=[{'Name': 'instance-state-name', 'Values': ['stopped']}]
            )

            for reservation in response['Reservations']:
                for instance in reservation['Instances']:
                    instance_details = {
                        'Region': region,
                        'Instance Type': instance.get('InstanceType'),
                        'External IP (Public)': instance.get('PublicIpAddress', "None")
                    }
                    all_instances.append(instance_details)
        except ClientError as error:
            print(f"Failed to retrieve instances for {region}. Error: {error}")
            if error.response['Error']['Code'] == "AuthFailure":
                print("Authentication failure. Possible issues with access in", region)
                try:
                    print("Token details: Expiry:", session.get_credentials().expiration)
                except AttributeError:
                    print("No expiration information available for credentials.")

    print("\nList of running EC2 instances:")
    print("Region | Instance Type | External IP")
    for instance in all_instances:
        print(f"{instance['Region']} | {instance['Instance Type']} | {instance['External IP (Public)']}")

if __name__ == '__main__':
    list_ec2_instances()
