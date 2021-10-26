resource "aws_lb_target_group" "test" {
  name     = "target group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.masteroll.id
}


resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.test.arn
  target_id        = aws_instance.test.id
  port             = 80
}

resource "aws_lb_target_group" "test" {
  # ... other configuration ...
}

resource "aws_instance" "test" {
  aws_instance.WebServer1
  aws_instance.WebServer2
}