provider "aws" {
  region = "ap-south-2"
}

# -----------------------------
# Security Group
# -----------------------------

resource "aws_security_group" "nikk_sg" {
  name        = "nikk-security-group"
  description = "Allow SSH and HTTP access"

  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP Access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "NikkSecurityGroup"
  }
}

# -----------------------------
# EC2 Instance
# -----------------------------

resource "aws_instance" "nikk_ec2" {

  ami           = "ami-024ebedf48d280810"
  instance_type = "t3.medium"

  key_name = "nikk-key"

  vpc_security_group_ids = [
    aws_security_group.nikk_sg.id
  ]

  tags = {
    Name = "NikkTerraformEC2"
  }
}

# -----------------------------
# S3 Bucket
# -----------------------------

resource "aws_s3_bucket" "nikk_bucket" {

  bucket = "nikk-s3-bucket"

  tags = {
    Name = "NikkTerraformBucket"
  }
}
