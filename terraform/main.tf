provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket_prefix = "tf-example-"
}

terraform {
  backend "s3" {
    bucket         = "terraform-state"
    key            = "terraform/state"
    region         = "us-east-1"
  }
}

