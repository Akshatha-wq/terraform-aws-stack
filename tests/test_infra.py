import os

import boto3

REGION = os.getenv("AWS_REGION", "us-west-2")
ENV = os.getenv("TF_WORKSPACE", "dev")


def test_eks_cluster_active():
    eks = boto3.client("eks", region_name=REGION)
    cluster = eks.describe_cluster(name=f"{ENV}-eks-cluster")
    assert cluster["cluster"]["status"] == "ACTIVE"


def test_rds_instance_available():
    rds = boto3.client("rds", region_name=REGION)
    dbs = rds.describe_db_instances()
    names = [db["DBInstanceIdentifier"] for db in dbs["DBInstances"]]
    assert f"{ENV}-appdb" in names


def test_vpc_exists():
    ec2 = boto3.client("ec2", region_name=REGION)
    vpcs = ec2.describe_vpcs(
        Filters=[{"Name": "tag:Name", "Values": [f"{ENV}-vpc"]}]
    )
    assert len(vpcs["Vpcs"]) == 1


def test_eks_nodes_ready():
    eks = boto3.client("eks", region_name=REGION)
    ng = eks.describe_nodegroup(
        clusterName=f"{ENV}-eks-cluster",
        nodegroupName=f"{ENV}-nodes",
    )
    assert ng["nodegroup"]["status"] == "ACTIVE"
