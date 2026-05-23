# 1. Security for the Public API Gateway
resource "aws_security_group" "public_sg" {
  name        = "public-api-sg"
  description = "Allow web traffic from the internet"
  vpc_id      = aws_vpc.main_vpc.id

  # Inbound rule: Allow custom API port from anywhere
  ingress {
    from_port   = 3111
    to_port     = 3111
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound rule: Allow the computer to talk to the internet
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 2. Security for the Private Workers
resource "aws_security_group" "private_sg" {
  name        = "private-worker-sg"
  description = "Allow internal traffic only"
  vpc_id      = aws_vpc.main_vpc.id

  # Inbound rule: Allow traffic ONLY from inside our own VPC
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16"]
  }

  # Outbound rule: Allow the computers to reply
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
