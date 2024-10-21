# get AmazonEKSClusterPolicy arn
data "aws_iam_policy" "aws_managed_eks_cluster" {
  name = "AmazonEKSClusterPolicy"
}

data "aws_iam_policy" "aws_managed_eks_worker_node" {
  name = "AmazonEKSWorkerNodePolicy"
}
data "aws_iam_policy" "aws_managed_ec_2_container_registry_read_only" {
  name = "AmazonEC2ContainerRegistryReadOnly"
}
data "aws_iam_policy" "aws_managed_eks_cni_policy" {
  name = "AmazonEKS_CNI_Policy"
}
data "aws_iam_policy" "aws_managed_ebs_csi_driver_policy" {
  name = "AmazonEBSCSIDriverPolicy"
}



# create iam role for cluster and with trust policy
resource "aws_iam_role" "eks_cluster_policy" {
  name = var.iam_cluster_policy
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "eks.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}
# create iam role for worker node and with trust policy
resource "aws_iam_role" "eks_node_policy" {
  name = var.iam_node_policy
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

# attach AmazonEKSClusterPolicy,AmazonEKSWorkerNodePolicy to eks_cluster_policy
resource "aws_iam_role_policy_attachment" "eks_cluster_policy_attachment" {
  role       = aws_iam_role.eks_cluster_policy.name
  policy_arn = data.aws_iam_policy.aws_managed_eks_cluster.arn
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy_attachment_2" {
  role       = aws_iam_role.eks_cluster_policy.name
  policy_arn = data.aws_iam_policy.aws_managed_eks_worker_node.arn
}

# attach AmazonEC2ContainerRegistryReadOnly,AmazonEKSWorkerNodePolicy,AmazonEC2ContainerRegistryReadOnly,AmazonEKS_CNI_Policy,AmazonEBSCSIDriverPolicy to eks_node_policy
resource "aws_iam_role_policy_attachment" "eks_node_policy_attachment" {
  role       = aws_iam_role.eks_node_policy.name
  policy_arn = data.aws_iam_policy.aws_managed_eks_worker_node.arn
}
resource "aws_iam_role_policy_attachment" "eks_node_policy_attachment_1" {
  role       = aws_iam_role.eks_node_policy.name
  policy_arn = data.aws_iam_policy.aws_managed_ec_2_container_registry_read_only.arn
}
resource "aws_iam_role_policy_attachment" "eks_node_policy_attachment_2" {
  role       = aws_iam_role.eks_node_policy.name
  policy_arn = data.aws_iam_policy.aws_managed_eks_cni_policy.arn
}
resource "aws_iam_role_policy_attachment" "eks_node_policy_attachment_3" {
  role       = aws_iam_role.eks_node_policy.name
  policy_arn = data.aws_iam_policy.aws_managed_ebs_csi_driver_policy.arn
}


