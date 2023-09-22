resource "aws_lb" "lb-01" {
    name               = "lb-01"
    internal           = false
    load_balancer_type = "application"
    ip_address_type    = "ipv4" 
    security_groups    = ["${aws_security_group.load_balancer_sg.id}"]
    # subnet            = aws_subnet.project_pub_sub1.id
    subnets            = [aws_subnet.project_pub_sub1.id, aws_subnet.project_pub_sub2.id]

    # enable_deletion_protection = true

    tags = {
    Environment = "production"
    }
}

resource "aws_lb_listener" "listen-lb-01" {
    load_balancer_arn = aws_lb.lb-01.arn
    port              = "80"
    protocol          = "HTTP"

    default_action {
        target_group_arn    = aws_lb_target_group.alb-example.arn
        type                = "forward"

    redirect {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
    }
    }
}