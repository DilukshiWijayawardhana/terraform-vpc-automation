# 1. create the api gateway
resource "aws_instance" "api_gateway" {
  ami                    = "ami-079db87dc4c10ac91" 
  instance_type          = "t3.micro"              
  subnet_id              = var.public_subnet_id    
  vpc_security_group_ids = [var.public_sg_id] 

  tags = {
    Name = "public-api-gateway"
  }
}

# 2. create the python ai worker
resource "aws_instance" "python_worker" {
  ami                    = "ami-079db87dc4c10ac91" 
  instance_type          = "t3.micro"              
  subnet_id              = var.private_subnet_id   
  vpc_security_group_ids = [var.private_sg_id] 

  tags = {
    Name = "private-python-worker"
  }
}

# 3. create the typescript caller worker
resource "aws_instance" "ts_worker" {
  ami                    = "ami-079db87dc4c10ac91" 
  instance_type          = "t3.micro"              
  subnet_id              = var.private_subnet_id   
  vpc_security_group_ids = [var.private_sg_id] 

  tags = {
    Name = "private-ts-worker"
  }
}
