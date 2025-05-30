variable "web_sg" {
  description = "Security group ID for the web ALB"
  type        = string
}

variable "app_sg" {
  description = "Security group ID for the app ALB"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet IDs for the web ALB"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet IDs for the app ALB"
  type        = list(string)
}

variable "tags" {
  description = "Tags to apply to the load balancers"
  type        = map(string)
}

variable "web_target_arn" {
  description = "ARN of the target group for the web ALB"
  type        = string
}

variable "app_target_arn" {
  description = "ARN of the target group for the app ALB"
  type        = string
}

variable "enable_https" {
  description = "Flag to enable HTTPS listener"
  type        = bool
  default     = false
}

variable "certificate_arn" {
  description = "ARN of the SSL certificate for HTTPS listeners"
  type        = string
  default     = ""
}

variable "app_port" {
  description = "Port number for the app ALB listener"
  type        = number
  default     = 80
}
