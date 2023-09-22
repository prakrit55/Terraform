resource "aws_vpc" "project_vpc-1" {
    cidr_block       =   var.cidr_block
    # security_group = ["${aws_security_group.load_balancer_sg.id}"]
    #"10.0.0.0/16"

    tags = {
        Name = "custom_vpc"
    }
}