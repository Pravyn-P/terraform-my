resource "aws_instance" "main" {
    ami = "ami-006935d9a6773e4ec"
    instance_type = "t3.micro"
tags = {
    Name = "terraform"
}
}
