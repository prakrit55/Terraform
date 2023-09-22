resource "aws_route_table" "project_priv_rt" {
    vpc_id = aws_vpc.project_vpc-1.id
}

resource "aws_route_table" "project_pub_rt" {
    vpc_id = aws_vpc.project_vpc-1.id
}


resource "aws_route_table_association" "project-pub-sub1-rt-association" {
    route_table_id = aws_route_table.project_pub_rt.id
    subnet_id = aws_subnet.project_pub_sub1.id
}

resource "aws_route_table_association" "project-pub-sub2-rt-association" {
    route_table_id = aws_route_table.project_pub_rt.id
    subnet_id = aws_subnet.project_pub_sub2.id
}

resource "aws_route_table_association" "project-priv-rt-association" {
    route_table_id = aws_route_table.project_priv_rt.id
    subnet_id = aws_subnet.project_priv_sub.id
}



resource "aws_route" "route-pub-rt" {
    route_table_id = aws_route_table.project_pub_rt.id
    destination_cidr_block = var.rt_destination_cidr
    gateway_id = aws_internet_gateway.igw_01.id

}

resource "aws_route" "route-priv1-rt" {
    route_table_id = aws_route_table.project_priv_rt.id
    destination_cidr_block = var.rt_destination_cidr
    gateway_id = aws_internet_gateway.igw_01.id

}