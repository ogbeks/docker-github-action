#configure the aws provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "d2b_s3_tstate_store" {
  bucket= "tf-tstate"
  # Prevent accidental deletion of this S3 bucket
  lifecycle {
    prevent_destroy=true
  }
}

resource "aws_s3_bucket_versioning" "tstate_versioning"{
  bucket= aws_s3_bucket.d2b_s3_tstate_store.id
  versioning_configuration{
    status="Enabled"
  }
}

terraform {
  backend "s3" {
    bucket  = "tf-tstate"
    key     = "tf/terraform.tfstate"
    region  = "us-east-1"
  }
}

