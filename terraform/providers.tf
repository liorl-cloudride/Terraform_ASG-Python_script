terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket         = "flight-tlv-state-file"
    key            = "flight-tlv/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "flight-tlv-state-locking-file"
    encrypt        = true
  }
}

provider "aws" {
    region = var.region
    profile = var.profile
    # profile = "flight-tlv"
}