resource "aws_lb" "albmasteroll" {
  name               = "Masteroll"
  internal           = false
  load_balancer_type = "application"
  #Chech this line
  security_groups    = [aws_security_group.lb_sg.id]
  
  subnet_mapping {
    subnet_id     = aws_subnet.masteroll-private-1.id
   
  }

  subnet_mapping {
    subnet_id     = aws_subnet.masteroll-private-2.id
    
  }

  tags = {
    Environment = "production"
  }
}

# ---------------------------aws_lb_listener-----------------------------------
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.front_end.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.front_end.arn
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.front_end.arn
  port              = "80"
  protocol          = "HTTPs"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.front_end.arn
  }
}

# ---------------------------Instance_target_group-----------------------------------
resource "aws_lb_target_group" "masterol-target-group" {
  name     = "masterol-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.masteroll.id 
  
}
resource "aws_vpc" "masteroll" {
  cidr_block = "10.0.0.0/16"
}


 #---------------------------Target_group_attachment-----------------------------------


resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.test.arn
  target_id        = aws_instance.test.id
  port             = 80
}

resource "aws_lb_target_group" "test" {
  # ... other configuration ...
}

resource "aws_instance" "test" {
  # ... other configuration ...
  #aws_instance.WebServer1
  #aws_instance.WebServer2
}

 #---------------------------security_group-----------------------------------
resource "aws_security_group" "allow-alb" {
  vpc_id      = aws_vpc.masteroll.id
  name        = "allow-alb"
  description = "security group that allows alb and all egress traffic"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow-alb"
  }
}
