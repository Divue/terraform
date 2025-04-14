terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws" # Use the official AWS provider
      version = "5.94.1"        # Pinning provider version for consistency
    }
    random = {
      source  = "hashicorp/random" # Random provider used to generate unique bucket names
      version = "3.1.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" # AWS region where the resources will be created
}

# Generate a random 8-byte hex string to make the bucket name unique
resource "random_id" "rand_id" {
  byte_length = 8
}

# Create an S3 bucket with a unique name using the random_id
resource "aws_s3_bucket" "mywebapp-bucket" {
  bucket = "mywebapp-bucket-${random_id.rand_id.hex}"
}

# Allow public access to the bucket by disabling all public access blocks
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.mywebapp-bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Attach a bucket policy to allow public read access (for a static website)
resource "aws_s3_bucket_policy" "mywebapp" {
  bucket = aws_s3_bucket.mywebapp-bucket.id
  policy = jsonencode(
    {
      Version = "2012-10-17",
      Statement = [
        {
          Sid       = "PublicReadGetObject",
          Effect    = "Allow",
          Principal = "*",                                     # Allow everyone (anonymous access)
          Action    = "s3:GetObject",                          # Allow only object read
          Resource  = "${aws_s3_bucket.mywebapp-bucket.arn}/*" # Applies to all objects
        }
      ]
    }
  )
}

# Configure the S3 bucket to host a static website
resource "aws_s3_bucket_website_configuration" "mywebapp" {
  bucket = aws_s3_bucket.mywebapp-bucket.id

  index_document {
    suffix = "index.html" # Main entry point file
  }
}

# Upload index.html to the bucket
resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.mywebapp-bucket.bucket
  source       = "./index.html" # Local file path
  key          = "index.html"   # S3 object key
  content_type = "text/html"
}

# Upload styles.css to the bucket
resource "aws_s3_object" "styles_css" {
  bucket       = aws_s3_bucket.mywebapp-bucket.bucket
  source       = "./styles.css" # Local CSS file
  key          = "styles.css"
  content_type = "text/css"
}

# Output the website endpoint after deployment
output "name" {
  value = aws_s3_bucket_website_configuration.mywebapp.website_endpoint
}
