resource "aws_instance" "builder-app" {
    ami = "ami-00c39f71452c08778"
    instance_type = "t2.micro"
}
