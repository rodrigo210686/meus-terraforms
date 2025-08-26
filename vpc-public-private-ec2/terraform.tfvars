bucket_name = "dev-proj-1-remote-state-bucket-rodrigo"
name        = "environment"
environment = "dev-1"

vpc_cidr                    = "10.0.0.0/16"
vpc_name                    = "dev-proj-us-east-1-vpc-1"
public_subnet_ipv6_prefixes = [0, 1, 2]
private_subnet_ipv6_prefixes = [3, 4, 5]
cidr_public_subnet          = ["10.0.21.0/24", "10.0.22.0/24", "10.0.23.0/24"]
cidr_private_subnet         = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
us_availability_zone        = ["us-east-1a", "us-east-1b", "us-east-1c"]

public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDB98cRQ5Ds+1/BF4VPT4Y5LvySwMHq26kSVkQj+CI3cv2+o6TOi1vogjEIikiPo9TwoxXKzhnzKUhuipGNFH4vy/tbRRvtb+jPSTpyLZmFUR2Yqb1YaSiXX7arGLFJ4IEymHYTWf9h93rS5Z/GBapn3tLE3jko4bLLTcMx4sXs/MAMO1kf3yIhhKhysFXlud8uLQv7b8r4bbUh7NNgaia2/XV1Frd1R04jV0nH1Ayh8lVz8rpT6WYdlncRK/hxfnJm5wQa7hDoN8QuOvtAtwCbEe6v+oU+T5pQ6oADw3xhiwFDYlVpd9lkndNvGNaGr0XMlJQY1A0jNcgcYd3FGlrFmLPuZ5j/ZdmRN+JTy5LFJSb8kWFChTI3H/jzjru0mkIshLWCkJKZQJ5O6ZwImwWJ4K76fHYYs3mb8Da6aEs+Y7nBjIhFUQd4mXcCJ+XDrXAohkOnZn3mrY8JM7u+lRQY9B1rCZxXjtpV7b+t53fKQf3XQ2/obJMoe0PuwZkV4LqAUoQrWqbf1T159SQVwYAGqI35T8J1VChSG3I7sWIMRwLoiKtDzm4/SWUE/idxuSZSHVJ6AAfo46EjLELd+mY/x+giewsfZB4PJ1Nn//H3ZJDyBqvL7QT0jidwsWwWC2NX+sneg0k4zO83xYcJH/DJ3Hqzwg8Nti4TpNdsd+1x6w== rodrigo@rodrigo-dell"

ec2_ami_id = "ami-0360c520857e3138f"

#instance_type = "t2.micro"

ec2_user_data_install_apache = ""

domain_name = "jhooq.org"