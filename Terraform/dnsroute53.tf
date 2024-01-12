resource "aws_route53_zone" "main" {
  name = var.hosted_zone_name
}

resource "aws_route53_record" "subdomain" {
  zone_id = aws_route53_zone.main.zone_id
  name = var.subdomain_name
  type = "A"
  alias {
    name = var.elb_dns_name
    zone_id = var.elb_zone_id
    evaluate_target_health = true
  }
}