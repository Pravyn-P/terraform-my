data "aws_ami" "ami-info" {
    most_recent = true
    owners = ["137112412989"] # this is the amazon's account id itself
    filter {
    name = "name"
    values = ["amzn2-ami-kernel-*-x86_64-gp2"]
    }
    filter {
    name = "root-device-type"
    values = ["ebs"]
    }
    filter {
    name = "virtualization-type"
    values = ["hvm"]
    }
}