resource "aws_eks_cluster" "example" {
  name     = "example"
  role_arn = var.rolearn

  vpc_config {
    subnet_ids = [subnet-62c32548, subnet-9fcc53e7]
  }
 depends_on = [
    aws_iam_role_policy_attachment.example-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.example-AmazonEKSVPCResourceController,
  ]
}

output "endpoint" {
  value = aws_eks_cluster.example.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.example.certificate_authority[0].data
}