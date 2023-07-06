resource "aws_vpc" "main" {   # resource <resource name> <randomn name to detect for terraform, this name belongs to terrform>
    cidr_block = var.cidr
    instance_tenancy = "default"
    tags = var.tags
}
resource "aws_subnet" "public" {
    vpc_id = aws_vpc.main.id   # it will fetch vpc id created from above code
    cidr_block = var.public_subnet_cidr
    tags = var.tags
}
resource "aws_subnet" "private-subnet" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.2.0/24"
    tags = var.tags
}
resource "aws_internet_gateway" "main" {
    vpc_id = aws_vpc.main.id   # internet gateway depends on vpc
    tags = var.tags
}
resource "aws_route_table" "public-rt" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.main.id
    }
     tags = var.tags
}
resource "aws_eip" "main" {
    tags = var.tags
}
resource "aws_nat_gateway" "main" {
    allocation_id = aws_eip.main.id
    subnet_id = aws_subnet.public.id
    tags = var.tags
    # to ensure proper ordering, it is recommended to add an explicit dependancy on the internet gateway for the vpc
    depends_on = [aws_internet_gateway.main]  
}
resource "aws_route_table" "private-rt" {   # for private route we don't attach internet gateway, we atach NAT gateway
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.main.id
    }
    tags = var.tags
}
resource "aws_route_table_association" "public-association" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public-rt.id
}
resource "aws_route_table_association" "private-association" {
    route_table_id = aws_route_table.private-rt.id
    subnet_id = aws_subnet.private-subnet.id
}