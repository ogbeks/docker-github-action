#configure the aws provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket_prefix = "tf-example-"
}

terraform {
  required_providers {
    aws= {
      source="hashicorp/aws"
      version="~> 5.0"
    }
  }
}

