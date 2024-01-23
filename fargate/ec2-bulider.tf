resource "aws_instance" "builder-app" {
    ami = "ami-0c0b74d29acd0cd97"
    instance_type = "t2.micro"
}
