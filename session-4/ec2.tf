resource "aws_instance" "main" {
    ami = data.aws_ami.ami-info.image_id
    instance_type = "t3.micro"
tags = {
    Name = "terraform"
}
}
