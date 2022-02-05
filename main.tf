provider "aws" {
  region     = "eu-central-1"
}

resource "aws_instance" "i-amazon-linux-prod" {
  ami                         = "ami-030e490c34394591b"
  instance_type               = "t2.micro"
  key_name                    = "aws-eucentral-linux"
  vpc_security_group_ids = ["sg-0c224099ae515e7fa"]
  iam_instance_profile = "FA-SSM"
  user_data = <<EOF
#!/bin/bash
sudo dnf install -y https://s3.us-east-1.amazonaws.com/amazon-ssm-us-east-1/latest/linux_amd64/amazon-ssm-agent.rpm 
sudo systemctl start amazon-ssm-agent
sudo systemctl enable amazon-ssm-agent
EOF
 
  tags = {
    Tenable = "FA"
  } 
}


resource "aws_instance" "i-redhat" {
  ami                         = "ami-06ec8443c2a35b0ba"
  instance_type               = "t2.micro"
  key_name                    = "aws-eucentral-linux"
  vpc_security_group_ids = ["sg-0c224099ae515e7fa"]
  iam_instance_profile = "FA-SSM"
  user_data = <<EOF
#!/bin/bash
sudo dnf install -y https://s3.us-east-1.amazonaws.com/amazon-ssm-us-east-1/latest/linux_amd64/amazon-ssm-agent.rpm 
sudo systemctl start amazon-ssm-agent
sudo systemctl enable amazon-ssm-agent
EOF
 
  tags = {
    Tenable = "FA"
  } 
}

resource "aws_instance" "i-redhat2" {
  ami                         = "ami-06ec8443c2a35b0ba"
  instance_type               = "t2.micro"
  key_name                    = "aws-eucentral-linux"
  vpc_security_group_ids = ["sg-0c224099ae515e7fa"]
  iam_instance_profile = "FA-SSM"
  user_data = <<EOF
#!/bin/bash
sudo dnf install -y https://s3.us-east-1.amazonaws.com/amazon-ssm-us-east-1/latest/linux_amd64/amazon-ssm-agent.rpm 
sudo systemctl start amazon-ssm-agent
sudo systemctl enable amazon-ssm-agent
EOF
 
  tags = {
    Tenable = "FA"
  } 
}
