resource "aws_instance" "priv-instance" {
    ami           = var.aws_ami
    instance_type = "t2.micro"
    subnet_id     = aws_subnet.project_priv_sub.id
    key_name       = "aigiri2"
    security_groups = ["${aws_security_group.load_balancer_sg.id}"]
    user_data       = <<-EOF
                        #!/bin/bash
                        sudo su
                        yum update -y
                        yum install httpd -y
                        systemctl start httpd
                        systemctl enable httpd
                        cd /etc/yum.repos.d
                        amazon-linux-extras install ansible2
                        cd
                        aws s3 cp s3://buckets3formyerrrstatedemo/index.html .
                        mv index.html /var/www/html/
                    EOF
}

resource "aws_instance" "pub-instance" {
    ami           = var.aws_ami
    instance_type = "t2.micro"
    security_groups = ["${aws_security_group.load_balancer_sg.id}"]
    subnet_id     = aws_subnet.project_pub_sub1.id
}


