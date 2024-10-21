provider "kubectl" {
  load_config_file       = false
  host                   = "${aws_eks_cluster.my_cluster.endpoint}"
  token                  = "${data.aws_eks_cluster_auth.main.token}"
  cluster_ca_certificate = "${base64decode(aws_eks_cluster.my_cluster.certificate_authority[0].data)}"
}

terraform {
  required_providers {
    kubectl = {
      source = "schizofreny/kubectl"
      version = "1.9.5"
    }
  }
}

