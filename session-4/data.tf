data "aws_ami" "ami-info" {
    most_recent = true
    #owners = [var.aws_accounts[data.aws_region.current.name]] # this is the amazon's account id itself
    owners = [lookup(var.aws_accounts,data.aws_region.current.name)]
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

# I want to get the VPC information of an existing VPC
data "aws_vpc" "existing-vpc" {
    id = "vpc-04227b441d0537f09"
}

output "vpc-info" {
    value = data.aws_vpc.existing-vpc
}