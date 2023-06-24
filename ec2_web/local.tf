locals{
    instance_name = "${var-project}-${var.environment}"
    load_balancer_name = "${var.project}-LB"
    subnets = data.aws_subnets.example
    target_group_name = "${var.project}-tg"
    dns_name = "tf-demo-${var.environment}.${var.hosted_zone}"
}