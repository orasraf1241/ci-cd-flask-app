terraform {
  required_version = ">= 0.13.0"

  backend "s3" {
    bucket = "testing-for-terraform"
    key    = "dev/eks/terraform.state"
    region = "eu-central-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.13"
    }
  }
}