data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default_vpc_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "aws_eks_cluster_auth" "main" {
  name = aws_eks_cluster.my_cluster.name
}
# data "aws_availability_zones" "available" {
# }
# output "available" {
#   value = aws_availability_zones.available
# }
# output "default_vpc_subnets" {
#   value=data.aws_subnets.default_vpc_subnets
# }
data "aws_subnet" "selected" {
  id = data.aws_subnets.default_vpc_subnets.ids[1]
}



