module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  name = "alb-masteroll"

  load_balancer_type = "application"

  vpc_id             = aws_vpc.masteroll.id
  subnets            = [aws_subnet.masteroll-private-1.id, aws_subnet.masteroll-private-2.id]
  security_groups    = ["sg-edcd9785"]



  target_groups = [
    {
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      targets = [
        {
          target_id = aws_instance.WebServer1.id
          port = 80
        },
        {
          target_id = aws_instance.WebServer2.id
          port = 80
        }
      ]
    }
  ]

  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = "arn:aws:iam::123456789012:server-certificate/test_cert-123456789012"
      target_group_index = 0
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    Environment = "Prod"
  }
}