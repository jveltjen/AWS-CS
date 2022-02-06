provider "aws" {
  region     = "eu-central-1"
}


resource "aws_security_group" "access_ssh" {
  name = "ssh-terraform"

  #Incoming traffic
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["213.211.183.93/32"] 
  }

  #Outgoing traffic
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "i-amazon-linux-prod" {
  ami                         = "ami-030e490c34394591b"
  instance_type               = "t2.micro"
  key_name                    = "aws-eucentral-linux"
  vpc_security_group_ids = ["ssh-terraform"]
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
  vpc_security_group_ids = ["ssh-terraform"]
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
  vpc_security_group_ids = ["ssh-terraform"]
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
