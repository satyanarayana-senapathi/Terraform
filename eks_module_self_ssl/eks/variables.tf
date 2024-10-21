variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "bootcamp-terraform"
}

# variable "cluster_role_arn" {
#   description = "The IAM role ARN for the EKS cluster"
#   type        = string
#   default     = "arn:aws:iam::365299945243:role/EKS_CLUSTER_ROLE"
# }

variable "cluster_version" {
  description = "The Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.27"
}

variable "cluster_tags" {
  description = "Tags to apply to the EKS cluster"
  type        = map(string)
  default = {
    name  = "satyanarayana"
    email = "satyanarayana.senapathi@zemosolabs.com"
  }
}

variable "node_group_name" {
  description = "The name of the EKS node group"
  type        = string
  default     = "bc113-node-group"
}

# variable "node_role_arn" {
#   description = "The IAM role ARN for the EKS node group"
#   type        = string
#   default     = "arn:aws:iam::365299945243:role/eks_node_role"
# }

variable "node_group_desired_size" {
  description = "The desired number of worker nodes"
  type        = number
  default     = 2
}

variable "node_group_max_size" {
  description = "The maximum number of worker nodes"
  type        = number
  default     = 2
}

variable "node_group_min_size" {
  description = "The minimum number of worker nodes"
  type        = number
  default     = 2
}

variable "node_group_instance_types" {
  description = "List of instance types to use for the nodes"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "node_group_disk_size" {
  description = "Root disk size (in GiB) for the worker nodes"
  type        = number
  default     = 20
}


variable "iam_cluster_policy" {
  description = "the clustername"
  type        = string
  default     = "satya-cluster-policy"
}

variable "iam_node_policy" {
  description = "the clustername"
  type        = string
  default     = "satya-node-policy"
}