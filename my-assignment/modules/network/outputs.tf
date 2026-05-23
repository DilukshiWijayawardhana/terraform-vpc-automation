
#public subnet id
output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

# private subnet id
output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}
# public security guard id
output "public_sg_id" {
  value = aws_security_group.public_sg.id
}

# private security guard id
output "private_sg_id" {
  value = aws_security_group.private_sg.id
}
