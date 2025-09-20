provider "aws" {
  region = var.aws_region
}

data "aws_availability_zones" "available" {}

provider "kubernetes" {
  host                   = aws_eks_cluster.main.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.main.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.main.token
  # load_config_file       = false
}

data "aws_eks_cluster_auth" "main" {
  name = aws_eks_cluster.main.name
}
