variable "aws_region" {
  type = string
}

variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  type        = list(string)
  description = "List of public subnet CIDR blocks"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnet CIDR blocks"
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "cluster_name" {
  type        = string
  description = "The name of the EKS cluster"
  default     = "devops-eks"
}

variable "cluster_version" {
  type        = string
  description = "The Kubernetes version for the EKS cluster"
  default     = "1.33"
}

variable "node_instance_type" {
  type        = string
  description = "The instance type for EKS managed nodes"
  default     = "t3.micro"
}

variable "desired_node_count" {
  type        = number
  description = "The desired number of nodes in the node group"
  default     = 2
}

variable "min_node_count" {
  type        = number
  description = "The minimum number of nodes in the node group"
  default     = 1
}

variable "max_node_count" {
  type        = number
  description = "The maximum number of nodes in the node group"
  default     = 4
}