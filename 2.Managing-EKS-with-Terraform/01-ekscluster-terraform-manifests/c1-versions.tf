terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.70"
     }
  }
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "t101study-tfstate"
    key    = "t101/eks-cluster/terraform.tfstate"
    region = "ap-northeast-2" 
 
    # For State Locking
    dynamodb_table = "terraform-locks"    
  }  
}

# Terraform Provider Block
provider "aws" {
  region = var.aws_region
}