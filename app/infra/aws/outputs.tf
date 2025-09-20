output "cluster_name" {
  value = aws_eks_cluster.main.name
}

output "kube_endpoint" {
  value = aws_eks_cluster.main.endpoint
}

output "cluster_certificate_authority_data" {
  value = aws_eks_cluster.main.certificate_authority[0].data
}

output "subnet_ids" {
  value = aws_subnet.public[*].id
}

output "dev_namespace" {
  value = kubernetes_namespace.dev.metadata[0].name
}

output "qa_namespace" {
  value = kubernetes_namespace.qa.metadata[0].name
}
