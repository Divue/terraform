# TASK-4  
# Multi-Region AWS Infrastructure with Terraform
## Project Objective

This project aims to provision a secure, scalable, and highly available web application infrastructure on AWS. The architecture includes:

- A **Virtual Private Cloud (VPC)** to enable network isolation.
- **Public and private subnets** distributed across multiple Availability Zones (AZs) for resilience.
- **Internet Gateway** and **NAT Gateways** to manage inbound and outbound internet traffic securely.
- **Security Groups** to control communication between application tiers.
- **Launch Templates** and **Auto Scaling Groups (ASGs)** to manage dynamic scaling of frontend and backend servers.
- **Application Load Balancers (ALBs)** for intelligent traffic distribution.
- An **RDS database** deployed in private subnets to enhance data security.

This setup provides a robust foundation for running production-grade web applications with a strong emphasis on availability, security, and performance.


## Resources Overview

### Infrastructure
- **Region**: 1 AWS Region  
- **Availability Zones**: 2 (for high availability)  
- **VPC**: Custom Virtual Private Cloud with isolated tiers  

### Subnets
- **Web Tier**: 1 public subnet per AZ  
- **App Tier**: 1 private subnet per AZ  
- **DB Tier**: 1 private subnet per AZ  

### Networking
- Internet Gateway (IGW) attached to VPC  
- NAT Gateway in each public subnet  
- Route Tables:
  - Public subnets route through IGW  
  - Private subnets route through NAT  

### Compute & Scaling
- Launch Templates for EC2 configurations  
- Auto Scaling Groups for:
  - Web Tier (frontend instances)  
  - App Tier (backend instances)  

### Load Balancing
- Public Application Load Balancer for Web Tier  
- Private ALB for App Tier  
- HTTP/HTTPS listeners with routing rules and target groups  

### EC2 Configuration
- Custom AMI, instance types, SSH key pair  
- Tier-based network placement (Web, App, DB)




##  Project Directory Layout

The Structure looks like:

```bash
├── .task 4/                      
├── modules/                         # Reusable infrastructure modules
│   ├── alb/
│   ├── computing/
│   ├── networking/
│   ├── rds/
│   ├── security/
│   └── vpc/
├── main.tf                          # Root Terraform config
├── outputs.tf                       # Output variables
├── provider.tf                      # Provider and backend settings                     
├── terraform.tfvars                 # Environment-specific input variables           
├── variables.tf                     # Variable declarations
```
##  Modular Architecture Overview

This project follows a modular Terraform design for clean, reusable, and maintainable infrastructure code. Below is a breakdown of each module’s responsibility:

---

### 🔹 VPC Module
- Provisions a custom VPC with a specified CIDR block.
- Creates public subnets (Web) and private subnets (App, DB) across Availability Zones.
- **Outputs**: VPC ID, Subnet IDs.

---

### 🔹 Networking Module
- Attaches an Internet Gateway (IGW) and sets up NAT Gateways using Elastic IPs.
- Creates and associates route tables for public and private subnets.
- **Outputs**: Gateway IDs, Route Table IDs.

---

### 🔹 Security Module
- Creates tier-specific Security Groups:
  - **Web Tier**: Allows HTTP/HTTPS from any source.
  - **App Tier**: Accepts traffic from Web Tier SG.
  - **DB Tier**: Accepts traffic from App Tier SG.
- **Outputs**: Security Group IDs.

---

### 🔹 Compute Module
- Defines Launch Templates for EC2 instances.
- Sets up Auto Scaling Groups for Web and App tiers in their respective subnets.
- Registers instances with corresponding Target Groups.
- **Outputs**: Target Group ARNs.

---

### 🔹 ALB Module
- Deploys:
  - Public ALB (Web Tier)
  - Private ALB (App Tier)
- Configures HTTP/HTTPS listeners and links to Target Groups.
- **Outputs**: ALB DNS Names, Listener ARNs.

---

### 🔹 RDS Module
- Sets up an RDS Subnet Group and provisions a database instance in private subnets.
- Configures DB engine, version, storage, and credentials.
- **Outputs**: DB Endpoint, DB Username.

---

## Terraform Configuration Files

- **`main.tf`**: Orchestrates all modules and passes interdependent values.
- **`variables.tf`**: Defines input variables and defaults.
- **`outputs.tf`**: Declares project-wide outputs like DNS and DB endpoints.
- **`terraform.tfvars`**: Provides custom values for variables.
- **`provider.tf`**: Configures AWS provider, version constraints, and optionally remote backends.

## Summary

This Terraform project offers a robust, modular, and secure foundation for deploying a multi-tier application on AWS. It automates the provisioning of essential infrastructure components, including:

- Networking
- Security
- Compute resources
- Load balancing
- Database services

By adhering to the provided structure and best practices, this setup ensures that your application environment is easy to manage, scalable, and secure.

# Follow these steps to deploy the infrastructure:

### 1. Initialize Terraform
```bash
terraform init
```
### 2. Review the Execution Plan
```bash
terraform plan
```
### 3. Apply the Configuration
```bash
terraform apply auto-approve
```
![WhatsApp Image 2025-05-29 at 17 24 44_58586ca4](https://github.com/user-attachments/assets/3d42df35-9f7d-4c1b-bf29-9fe22a9b09e2)

![WhatsApp Image 2025-05-29 at 17 25 52_4f61dd8e](https://github.com/user-attachments/assets/a140d874-05aa-4d7d-b834-d2254d503ab9)

![WhatsApp Image 2025-05-29 at 17 26 46_6bc584eb](https://github.com/user-attachments/assets/bcf0af7a-7996-4c92-8f2b-7a78f76434aa)

![WhatsApp Image 2025-05-29 at 17 28 51_cf5e123a](https://github.com/user-attachments/assets/e442029c-05be-4b11-a328-a8d46c1939f4)



