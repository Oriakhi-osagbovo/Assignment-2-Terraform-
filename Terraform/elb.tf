resource "aws_elb" "main" {
  name = "terraform-test-elb"
  subnets = var.subnets
  security_groups = [var.security_group_id]

  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTP:80/"
    interval = 30
  }
}
