data "kubectl_file_documents" "docs" {
  content = templatefile("${path.module}/manifests/nginx-ingress-controller.yaml", {
    acm_cert_arn = var.acm_cert_arn
  })
}

resource "kubectl_manifest" "test" {
  for_each  = toset(data.kubectl_file_documents.docs.documents)
  yaml_body = each.value
  depends_on = [
    aws_eks_node_group.my_cluster_node_group
  ]
}



