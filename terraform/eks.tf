module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  vpc_id     = aws_vpc.main.id
  subnet_ids = concat(aws_subnet.public[*].id, aws_subnet.private[*].id)

  eks_managed_node_group_defaults = {
    instance_types = [var.node_instance_type]
  }

  eks_managed_node_groups = {
    default = {
      name           = "${var.cluster_name}-node-group"
      desired_size   = var.desired_node_count
      min_size       = var.min_node_count
      max_size       = var.max_node_count

      instance_types = [var.node_instance_type]

      tags = {
        Name = "${var.cluster_name}-node-group"
      }
    }
  }

  tags = {
    Name = var.cluster_name
  }
}
