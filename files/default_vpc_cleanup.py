#!/usr/local/bin/python

import argparse
import boto3
import botocore


# AWS Default VPC Cleanup
#
# This script is used to automate the removal of all AWS default VPCs from all Regions.

__author__ = "Keith Rhea"
__email__ = "keithr@mindpointgroup.com"
__version__ = "1.0.0"

parser = argparse.ArgumentParser(prog="Default VPC Cleanup", description="An automated tool to remove all AWS default VPCs from all Regions")
parser.add_argument('-V', '--version', action='version', version=f"%(prog)s {__version__}")
parser.add_argument('-p', '--profile', help='Specify the name of boto profile to use for vpc cleanup', required=True)
args = parser.parse_args()


def getRegions():
    try:
        client = session.client('ec2')
    except botocore.exceptions.NoRegionError as e:
        return e

    regions = []

    try:
        for region in client.describe_regions()['Regions']:
            print("Found Region: " + region['RegionName'])
            regions.append(region['RegionName'])
        return regions
    except botocore.exceptions.ClientError as e:
        return e

def remove_internet_gateway(vpcId, client):
    try:
        igws = client.describe_internet_gateways(Filters=[{'Name': 'attachment.vpc-id','Values': [vpcId,]},],)
    except botocore.exceptions.ClientError as e:
        return e


    for igw in igws['InternetGateways']:
        igwId = igw['InternetGatewayId']
        try:
            print("Detaching Internet Gateway " + igwId + " from " + vpcId)
            client.detach_internet_gateway(InternetGatewayId=igwId,VpcId=vpcId)
        except botocore.exceptions.ClientError as e:
            return e
        try:
            print("Deleting Internet Gateway " + igwId)
            client.delete_internet_gateway(InternetGatewayId=igwId)
        except botocore.exceptions.ClientError as e:
            return e

def delete_subnets(vpcId, client):
    try:
        subnets = client.describe_subnets(Filters=[{'Name': 'vpc-id','Values': [vpcId,]},])
    except botocore.exceptions.ClientError as e:
        return e

    for subnet in subnets['Subnets']:
        subnetId = subnet['SubnetId']
        try:
            print("Deleting Subnet " + subnetId + " from " + vpcId)
            client.delete_subnet(SubnetId=subnetId,)
        except botocore.exceptions.ClientError as e:
            return e

def remove_default_vpcs(regions):
    dhcpInUse = False
    dhcpId = "Not-Set"
    for region in regions:
        try:
            client = session.client('ec2',region_name=region)
        except botocore.exceptions.ClientError as e:
            return e

        try:
            response = client.describe_vpcs(Filters=[{'Name': 'isDefault','Values': ['true',]}])
        except botocore.exceptions.ClientError as e:
            return e


        for vpcs in response['Vpcs']:
            vpcId = vpcs['VpcId']
            dhcpId = vpcs['DhcpOptionsId']
            print("[" + region + "]")
            remove_internet_gateway(vpcId, client)
            delete_subnets(vpcId, client)
            try:
                print("Deleting Default VPC " + vpcId)
                client.delete_vpc(VpcId=vpcs['VpcId'])
            except botocore.exceptions.ClientError as e:
                return e


        #Check if DHCPOptionSet used by Default VPC is in use by other VPCs
        try:
            response = client.describe_vpcs()
        except botocore.exceptions.ClientError as e:
            return e

        if response['Vpcs']:
            for vpcs in response['Vpcs']:
                if vpcs['DhcpOptionsId'] == dhcpId:
                    dhcpInUse = True
                    dhcpVPC = vpcs['VpcId']

            if dhcpInUse == True:
                print("DHCP Option Set: " + dhcpId + " is in use by: " + vpcs['VpcId'])
            else:
                try:
                    print("Deleting DHCP Option Set: " + dhcpId)
                    client.delete_dhcp_options(DhcpOptionsId=dhcpId)
                except botocore.exceptions.ClientError as e:
                    return e
        else:
            if dhcpId != "Not-Set":
                print("Deleting DHCP Option Set: " + dhcpId)
                client.delete_dhcp_options(DhcpOptionsId=dhcpId)
            else:
                print("No Default VPC's Found in: " + region)



if __name__ == "__main__":
    session = boto3.Session(profile_name=args.profile)
    print("Gathering regions")
    remove_default_vpcs(getRegions())
    # print(str(count) + " default VPCs deleted.")
