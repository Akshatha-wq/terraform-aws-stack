resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr
    enable_dns_hostmame = true
    enable_dns_support = true
    tags = { Name = "${var.env}-vpc" }
}
resource "aws_subnet" "public" {
    count = length (var.public_subnet_cidrs)
    vpc_id = aws_vpc.main.id
    cidr_block = var.public_subnet_cidrs[count.index]
    availibility_zones = var.azs[count.index]
    map_public_ip_on_launch = true
    tags= { Name =${var.env}-public-$[count.index]" }
}
resource "aws_subnet" "private" {
    count = length (var.private_subnet_cidrs)
    vpc_id = aws_vpc.main.id
    cidr_block = var.private_subnet_cidrs[count.index]
    availibility_zones = var.azs[count.index]
    tags= { Name =${var.env}-private-$[count.index]" }
}
resource "aws_internet_gateway" "main" {
    vpc_id = aws_vpc.main.id
    tags= { Name =${var.env}-igw" }
}