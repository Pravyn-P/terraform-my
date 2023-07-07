output "ip_address" {
    value = aws_instance.main.public_ip
}
output "ami_id" {
    value = data.aws_ami.ami-info.image_id
}