output "web_alb_dns_name" {
  value       = aws_lb.webalb.dns_name
}

output "app_alb_dns_name" {
  value       = aws_lb.alb1.dns_name
}

output "web_alb_arn" {
  value       = aws_lb.webalb.arn
}

output "app_alb_arn" {
  value       = aws_lb.alb1.arn
}

