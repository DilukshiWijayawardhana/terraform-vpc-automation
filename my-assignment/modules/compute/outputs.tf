# API Gateway's Public IP
output "api_public_ip" {
  value = aws_instance.api_gateway.public_ip
}
