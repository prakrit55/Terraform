resource "aws_subnet" "project_pub_sub1" {

cidr_block = var.pub_sub1_cidr
availability_zone = var.pub_sub1_az
vpc_id = aws_vpc.project_vpc-1.id

}

resource "aws_subnet" "project_pub_sub2" {

cidr_block = var.pub_sub2_cidr
availability_zone = var.pub_sub2_az
vpc_id = aws_vpc.project_vpc-1.id

}

resource "aws_subnet" "project_priv_sub" {

cidr_block = var.priv_sub_cidr
availability_zone = var.priv_sub_az
vpc_id = aws_vpc.project_vpc-1.id

}