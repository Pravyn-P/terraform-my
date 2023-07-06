resource "aws_instance" "main" {
    ami = "ami-0b9ecf71fe947bbdd"
    instance_type = "t3.micro"
tags = {
    Name = "terraform"
}
}
