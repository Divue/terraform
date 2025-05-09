TASK 1 

Install Terraform & AWS CLI
Configure AWS CLI using Access & Secret Key
Create provider.tf & main.tf files
Paste instance resource block from AWS Terraform documentation
Modify resource block to create an EC2 Instance with below config:
* Pass Ubuntu AMI ID
* Instance type is T3.Micro
* Pass Subnet ID manually 
* Disable Public IP Address
* Increase EBS Volume from default 8 GBs to 12 GB
* 

Once Completed, create variables.tf & terraform.tfvars files
variabalize above values and pass the values from terraform.tfvars file