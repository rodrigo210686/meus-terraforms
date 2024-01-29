data "aws_vpc" "default" {
 default = true
}

resource "aws_security_group" "app_builder_sg" {
  name        = "app-builder-sg"
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




resource "aws_instance" "builder-app" {
    ami = "ami-008677ef1baf82eaf"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.app_builder_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo -i
              cd /root
              ###Instalar node e npm
              curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
              . ~/.nvm/nvm.sh
              nvm install 16  
              ###Instalar o docker
              yum update
              yum search docker
              yum info docker
              yum install docker  -y
              ### Buil app
              aws s3 cp s3://app-globo-mantics/globomantics.tar /root/
              tar -xvf globomantics.tar
              cd /root/globomantics/
              npm start

              EOF
  iam_instance_profile = aws_iam_role.ssm_role2.name
  tags = {
     Name = "builder-app"
     type = "ec2"
  }
}
