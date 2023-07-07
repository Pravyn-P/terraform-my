resource "aws_instance" "main" {
    ami = data.aws_ami.ami-info.image_id
    instance_type = "t3.micro"
    key_name = aws_key_pair.terraform.key_name
}
resource "aws_key_pair" "terraform" {
    key_name = "terraform"
    # this file function will read the terraform.pub and fetch the content
    public_key = file("${path.module}/terraform.pub")
}
