terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket         = "flight-tlv-terraform-state-file"
    key            = "flight-tlv/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "flight-tlv-terraform-state-locking-file"
    encrypt        = true
    profile        = "flight-tlv"
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile
  # profile = "flight-tlv"
  default_tags {
    tags = {
      Managed_by = "Terraform"
      Owner      = "Cloudride"
    }
  }
}
