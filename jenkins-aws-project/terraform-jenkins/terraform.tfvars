bucket_name = "dev-proj-1-jenkins-remote-state-bucket-rodrigo"

vpc_cidr             = "10.0.0.0/16"
vpc_name             = "dev-proj-jenkins-us-east-1-vpc-1"
cidr_public_subnet   = ["10.0.1.0/24", "10.0.2.0/24"]
cidr_private_subnet  = ["10.0.3.0/24", "10.0.4.0/24"]
us_availability_zone = ["us-east-1a", "us-east-1b"]

public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDB98cRQ5Ds+1/BF4VPT4Y5LvySwMHq26kSVkQj+CI3cv2+o6TOi1vogjEIikiPo9TwoxXKzhnzKUhuipGNFH4vy/tbRRvtb+jPSTpyLZmFUR2Yqb1YaSiXX7arGLFJ4IEymHYTWf9h93rS5Z/GBapn3tLE3jko4bLLTcMx4sXs/MAMO1kf3yIhhKhysFXlud8uLQv7b8r4bbUh7NNgaia2/XV1Frd1R04jV0nH1Ayh8lVz8rpT6WYdlncRK/hxfnJm5wQa7hDoN8QuOvtAtwCbEe6v+oU+T5pQ6oADw3xhiwFDYlVpd9lkndNvGNaGr0XMlJQY1A0jNcgcYd3FGlrFmLPuZ5j/ZdmRN+JTy5LFJSb8kWFChTI3H/jzjru0mkIshLWCkJKZQJ5O6ZwImwWJ4K76fHYYs3mb8Da6aEs+Y7nBjIhFUQd4mXcCJ+XDrXAohkOnZn3mrY8JM7u+lRQY9B1rCZxXjtpV7b+t53fKQf3XQ2/obJMoe0PuwZkV4LqAUoQrWqbf1T159SQVwYAGqI35T8J1VChSG3I7sWIMRwLoiKtDzm4/SWUE/idxuSZSHVJ6AAfo46EjLELd+mY/x+giewsfZB4PJ1Nn//H3ZJDyBqvL7QT0jidwsWwWC2NX+sneg0k4zO83xYcJH/DJ3Hqzwg8Nti4TpNdsd+1x6w== rodrigo@rodrigo-dell"
ec2_ami_id = "ami-0360c520857e3138f"