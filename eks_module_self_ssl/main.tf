provider "aws" {
  region = "us-east-1"
}

module "bootcamp" {
    source = "./eks"
    cluster_name="appsmith_from_the_business_testing"
    cluster_version="1.27"
    cluster_tags= {
        name  = "satyanarayana.senapathi"
        email = "satyanarayana.senapathi@zemosolabs.com"
    }
    node_group_name="bootcamp_bc-number_node"
    node_group_desired_size=2
    node_group_max_size=2
    node_group_min_size=2
    node_group_instance_types=["t3.medium"]
    node_group_disk_size=50
    iam_cluster_policy= "bootcamp-number-cluster"
    iam_node_policy= "bc-number-node"
}
