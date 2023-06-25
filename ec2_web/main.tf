## Create an EC2 instance manually
## https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

resource "aws_instance" "web_server" {
  #ami           = "ami-025d0fe6e3762da5a" 
  ami             = data.aws_ami.amazon.id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.web_server_sg.name]
  user_data       = <<-EOF
#!/bin/bash
yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo "WooHoo... Terraform running in ${var.environment}" > /var/www/html/index.html
EOF
  tags = {
    Name         = local.instance_name
    Environment  = var.environment
    Project      = var.project
    OrgCode      = var.orgCode
    DeployedFrom = path.cwd
  }
}

## Creating an Application Load Balancer

resource "aws_lb" "tf-demo-lb" {
  name                       = local.load_balancer_name
  internal                   = false
  load_balancer_type         = "application"
  enable_deletion_protection = false
  subnets                    = local.subnets
  security_groups            = [aws_security_group.lb_sg.id]
  tags = {
    Name         = local.load_balancer_name
    Environment  = var.environment
    Project      = var.project
    OrgCode      = var.orgCode
    DeployedFrom = path.cwd
  }
}

## Creating a Target Group 
resource "aws_lb_target_group" "tf_demo_tg" {
  name     = local.target_group_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    port     = "80"
    path     = "/"
    protocol = "HTTP"
  }
}

# Create a listener on the load balancer and forward traffic to target group created above
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.tf-demo-lb.arn
  port              = "80"
  protocol          = "HTTP"
  #   ssl_policy        = "ELBSecurityPolicy-2016-08"
  #   certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test.arn
  }
}

## Attach instance created above to the Target Group so that traffic will be forwarded to it
resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.test.arn
  target_id        = aws_instance.web_server.id
  port             = 80
}

## DNS - add DNS name 
resource "aws_route53_record" "tf-demo" {
  zone_id = data.aws_route53_zone.selected.id
  name    = local.dns_name
  type    = "A"

  alias {
    name                   = aws_lb.tf-demo-lb.dns_name
    zone_id                = aws_lb.tf-demo-lb.zone_id
    evaluate_target_health = true
  }
}