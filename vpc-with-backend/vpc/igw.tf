resource "aws_internet_gateway" "igw_01" {
    vpc_id = aws_vpc.project_vpc-1.id

}