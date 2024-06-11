#4 Create Route 53 Private Zone
resource "aws_route53_zone" "private_zone" {
  name          = "dave.com"
  vpc_id        = aws_vpc.vpc.id
  private_zone  = true
}

#4 Create Route 53 Record
resource "aws_route53_record" "nlb_record" {
  zone_id = aws_route53_zone.private_zone.zone_id
  name    = "dave.com"
  type    = "A"
  ttl     = "300"

  records = [aws_lb.nlb.dns_name]
}

#5 Request an SSL certificate from ACM
resource "aws_acm_certificate" "ssl_certificate" {
  domain_name       = "dave.com"
  validation_method = "DNS"

  tags = {
    Name = "dave-ssl-certificate"
  }
}

#5 Perform DNS validation for the SSL certificate
resource "aws_acm_certificate_validation" "ssl_certificate_validation" {
  certificate_arn         = aws_acm_certificate.ssl_certificate.arn
  validation_record_fqdns = [aws_acm_certificate.ssl_certificate.domain_validation_options.0.resource_record_name]

  depends_on = [aws_route53_record.nlb_record]
}