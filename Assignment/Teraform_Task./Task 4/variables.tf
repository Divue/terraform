variable "vpc_cidr" {
  type = string
}

variable "az_count" {
  type = number
}

variable "availability_zones" {
  type = list(string)
}

variable "tags" {
  type = map(string)
  default = {}
}

variable "key_name" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ami_id" {
  type = string
}

variable "user_data" {
  type    = string
  default = ""
}

variable "db_pass" {
  type      = string
  sensitive = true
}

variable "certificate_arn" {
  type = string
  default = ""
}

variable "enable_https" {
  type    = bool
  default = false
}

variable "app_port" {
  type    = number
  default = 80
}