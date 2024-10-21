resource "aws_eks_cluster" "my_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster_policy.arn
  version  = var.cluster_version

  vpc_config {
    # subnet_ids = data.aws_subnets.default_vpc_subnets.ids
    subnet_ids = ["subnet-7e9ef01b","subnet-3568b41e","subnet-35f7466c","subnet-f30095ff","subnet-5bf3622c"]
  }
  
  tags = var.cluster_tags
}

resource "aws_eks_node_group" "my_cluster_node_group" {
  cluster_name    = aws_eks_cluster.my_cluster.name
  node_group_name = var.node_group_name
  node_role_arn   = aws_iam_role.eks_node_policy.arn
  # subnet_ids      = data.aws_subnets.default_vpc_subnets.ids
  subnet_ids      = ["subnet-7e9ef01b","subnet-3568b41e","subnet-35f7466c","subnet-f30095ff","subnet-5bf3622c"]

  scaling_config {
    desired_size = var.node_group_desired_size
    max_size     = var.node_group_max_size
    min_size     = var.node_group_min_size
  }
  instance_types = var.node_group_instance_types
  disk_size      = var.node_group_disk_size
  tags = var.cluster_tags
  depends_on = [
    aws_eks_cluster.my_cluster,
  ]
}

resource "aws_eks_addon" "coredns" {
  cluster_name  = aws_eks_cluster.my_cluster.name
  addon_name    = "coredns"
  depends_on    = [aws_eks_node_group.my_cluster_node_group]
}

resource "aws_eks_addon" "kube-proxy" {
  cluster_name  = aws_eks_cluster.my_cluster.name
  addon_name    = "kube-proxy"
  depends_on    = [aws_eks_node_group.my_cluster_node_group]
}

resource "aws_eks_addon" "vpc-cni" {
  cluster_name  = aws_eks_cluster.my_cluster.name
  addon_name    = "vpc-cni"
  depends_on    = [aws_eks_node_group.my_cluster_node_group]
}
resource "aws_eks_addon" "ebs-csi-driver" {
  cluster_name  = aws_eks_cluster.my_cluster.name
  addon_name    = "aws-ebs-csi-driver"
  depends_on    = [aws_eks_node_group.my_cluster_node_group]
}