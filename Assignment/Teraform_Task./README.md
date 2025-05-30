## TERRAFORM & AWS Overview

### What is Terraform?  
Terraform, developed by HashiCorp, is a powerful open-source Infrastructure as Code (IaC) tool. It enables you to define, provision, and manage cloud infrastructure through simple, human-readable configuration files written in HCL (HashiCorp Configuration Language). Terraform supports a wide range of cloud providers including AWS, Azure, and Google Cloud, allowing you to automate infrastructure deployment consistently and reliably.

### Why Choose Terraform?  
- Automates the creation and management of infrastructure resources  
- Enables version control and collaboration for infrastructure changes  
- Supports deployment across multiple cloud platforms and hybrid environments  
- Encourages modular, reusable, and maintainable code structures  

### Common Terraform Configuration Files  

- **main.tf**  
  Contains the core resource definitions and infrastructure setup (e.g., EC2 instances, VPCs).

- **variables.tf**  
  Declares configurable inputs to customize deployments without modifying the core code.

- **terraform.tfvars**  
  Stores specific values for variables, often containing sensitive information; should be excluded from public repositories.

- **outputs.tf**  
  Defines outputs to display useful information after deployment, such as resource endpoints or IDs.

- **providers.tf**  
  Configures the cloud provider details, including region and authentication settings.  

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
