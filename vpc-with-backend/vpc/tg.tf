resource "aws_lb_target_group" "alb-example" {
    name        = "tf-example-lb-alb-tg"
    target_type = "instance"
    port        = 80
    protocol    = "HTTP"
    vpc_id      = aws_vpc.project_vpc-1.id

    health_check {
        interval           = 10
        path               = "/"
        protocol           = "HTTP"
        timeout            = 5
        healthy_threshold  = 5
        unhealthy_threshold = 2
    }
}

resource "aws_lb_target_group_attachment" "lb_target_group_att" {
    target_group_arn = aws_lb_target_group.alb-example.arn
    target_id        = aws_instance.priv-instance.id
    port             = 80
}
