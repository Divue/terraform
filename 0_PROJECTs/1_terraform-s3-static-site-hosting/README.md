
# Terraform S3 Static Website Hosting Setup

## Overview
This Terraform script sets up an **AWS S3 bucket** to host a **static website**. It covers creating a unique bucket name, uploading HTML and CSS files, enabling public access, and configuring the website.

## Key Points to Remember:

1. **Terraform Providers**:
   - **AWS Provider**: Manages AWS resources like S3, IAM, etc.
   - **Random Provider**: Used to generate unique values (e.g., for bucket names).

2. **Random ID Generation**:
   - Use the `random_id` resource to generate unique values (e.g., S3 bucket names) to avoid naming conflicts across AWS.
   - Example: `random_id.rand_id.hex` generates an 8-byte hex string.

3. **S3 Bucket Creation**:
   - S3 bucket names must be globally unique. The `random_id` helps ensure this uniqueness.
   - Example: `mywebapp-bucket-${random_id.rand_id.hex}`.

4. **Public Access Configuration**:
   - The `aws_s3_bucket_public_access_block` allows disabling or enabling public access to the S3 bucket.
   - Public read access is required to make the static website accessible to everyone.

5. **Bucket Policy**:
   - A bucket policy allows public read access to the objects in the bucket (such as HTML and CSS files).
   - The policy allows `s3:GetObject` action for all objects within the bucket.

6. **Website Configuration**:
   - `aws_s3_bucket_website_configuration` configures the bucket for static website hosting. The **index document** (`index.html`) must be specified.

7. **File Upload**:
   - `aws_s3_object` is used to upload local files (e.g., `index.html`, `styles.css`) to the bucket.
   - Ensure correct content types: `"text/html"` for HTML files and `"text/css"` for CSS files.

8. **Output**:
   - The `output` block provides the website URL (`website_endpoint`) after deployment, which can be used to access the hosted website.

## Reference Materials:

- **Terraform AWS Provider Documentation**:  
  [https://registry.terraform.io/providers/hashicorp/aws/latest/docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

- **Random Provider Documentation**:  
  [https://registry.terraform.io/providers/hashicorp/random/latest/docs](https://registry.terraform.io/providers/hashicorp/random/latest/docs)

- **S3 Website Hosting**:  
  [https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteHosting.html](https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteHosting.html)