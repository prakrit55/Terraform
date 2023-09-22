# Create a security group for the load balancer
resource "aws_security_group" "load_balancer_sg" {
    name        = "load-balancer-sg"
    description = "Security group for the load balancer"
    vpc_id      = aws_vpc.project_vpc-1.id

    # Allow incoming HTTP traffic from anywhere
    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

    # Allow incoming HTTPS traffic from anywhere
    ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
    # You can add more rules as needed, e.g., SSH access for administration
    # ingress {
    #   from_port   = 22
    #   to_port     = 22
    #   protocol    = "tcp"
    #   cidr_blocks = ["your_ip_address"]
    # }
    # Define outbound rules as needed
    # egress {
    # from_port   = 0
    # to_port     = 0
    # protocol    = "-1" # Allow all outbound traffic
    # cidr_blocks = ["0.0.0.0/0"]
    # }
}

resource "aws_security_group" "ec2-instance" {
    name        = "ec2-instance"
    description = "Security group for instances"


    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

}