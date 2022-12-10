# AWS EC2 Security Group Terraform Module
# Security Group for Public Bastion Host
module "eks_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.5.0"

  name = "eks-cluster-sg"
  description = "Security Group with all port open for everybody (IPv4 CIDR), egress ports are all port open"
  vpc_id = module.vpc.vpc_id
  # Ingress Rules & CIDR Blocks
  ingress_rules = ["all-all"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  # Egress Rule - all-all open
  egress_rules = ["all-all"]
  tags = local.common_tags
}