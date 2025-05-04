terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.94.1"
    }

    random = {
      source = "hashicorp/random"  # Correct provider source
      version = "3.1.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

resource "random_id" "rand_id" {
    byte_length=8
  
}

resource "aws_s3_bucket" "demo-aws_s3_bucket" {
  bucket = "demo-bucket-${random_id.rand_id.hex}"

}

resource "aws_s3_object" "bucket-data" {           #upload an object/file to s3 bucket
  bucket = aws_s3_bucket.demo-aws_s3_bucket.bucket # Use the S3 bucket created earlier
  source = "./myfile.txt"                          # Path to the local file that will be uploaded
  key    = "mydata.txt"                            # The key (name) the file will have in S3

}

output "name" {
  value = random_id.rand_id.hex
}