# terraform

## 🚀 Getting Started

> ✅ Make sure you have:
> - AWS CLI configured (`~/.aws/credentials` or `AWS_ACCESS_KEY_ID` & `AWS_SECRET_ACCESS_KEY` in env)
> - Terraform installed (`terraform -v`)

### 🔧 How to Run a Project:

```bash
cd 1_aws-ec2/            # Step into a specific Terraform directory
source .env
terraform init           # 🔹 One-time setup: downloads providers, sets up backend
terraform plan           # 🔍 Shows what Terraform will create/update/destroy
terraform apply          # 🚀 Provisions resources to AWS
terraform destroy        # 🧹 (Optional) Deletes all created resources


inside .env
AWS_ACCESS_KEY_ID=your-access-key-id
AWS_SECRET_ACCESS_KEY=your-secret-access-key
