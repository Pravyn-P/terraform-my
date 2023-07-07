data "aws_ami" "ami-info" {
    most_recent = true
    owners = [var.aws_accounts[data.aws_region.current.name]] # this is the amazon's account id itself
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

# I want to fetch which region i am in. The below example will fetch the info regarding your current region
data "aws_region" "current" {}

output "current-region" {
    value = data.aws_region.current.name
}