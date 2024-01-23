data "aws_vpc" "default" {
 default = true
}

resource "aws_security_group" "app_builder_sg" {
  name        = "sg-app-builder"
  description = "App Builder Security Group"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port = 3000
    to_port   = 3000
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
   from_port   = 0
   to_port     = 0
   protocol    = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
  # Add more ingress rules as needed
}

resource "aws_iam_role" "ssm_role" {
  name = "ec2-ssm-role"

  assume_role_policy = <<-EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ssm:DescribeAssociation",
                "ssm:GetDeployablePatchSnapshotForInstance",
                "ssm:GetDocument",
                "ssm:DescribeDocument",
                "ssm:GetManifest",
                "ssm:GetParameter",
                "ssm:GetParameters",
                "ssm:ListAssociations",
                "ssm:ListInstanceAssociations",
                "ssm:PutInventory",
                "ssm:PutComplianceItems",
                "ssm:PutConfigurePackageResult",
                "ssm:UpdateAssociationStatus",
                "ssm:UpdateInstanceAssociationStatus",
                "ssm:UpdateInstanceInformation"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "ssmmessages:CreateControlChannel",
                "ssmmessages:CreateDataChannel",
                "ssmmessages:OpenControlChannel",
                "ssmmessages:OpenDataChannel"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "ec2messages:AcknowledgeMessage",
                "ec2messages:DeleteMessage",
                "ec2messages:FailMessage",
                "ec2messages:GetEndpoint",
                "ec2messages:GetMessages",
                "ec2messages:SendReply"
            ],
            "Resource": "*"
        }
    ]
}
  EOF
}


resource "aws_instance" "builder-app" {
    ami = "ami-0c0b74d29acd0cd97"
    instance_type = "t2.micro"
    iam_instance_profile = aws_iam_role.ssm_role.ec2-ssm-role
    vpc_security_group_ids = [aws_security_group.app_builder_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              ###Instalar node e npm
              curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
              . ~/.nvm/nvm.sh
              nvm install 16  
              ###Instalar o docker
              yum update
              yum search docker
              yum info docker
              yum install docker  
              ### Buil app
              npx create-react-app globomantics
              cd globomantics/
              npm start

              EOF

  
  tags = {
     Name = "builder-app"
     type = "ec2"
  }
}
