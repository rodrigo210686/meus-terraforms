resource "aws_instance" "builder-app" {
    ami = "ami-0c0b74d29acd0cd97"
    instance_type = "t2.micro"

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
