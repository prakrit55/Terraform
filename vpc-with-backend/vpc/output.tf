output "vpc_id" {
    description = "This produces the id of vpc"
    value = aws_vpc.project_vpc-1.id
}

output "elb-dns-name" {
    value   = aws_lb.lb-01.dns_name
}