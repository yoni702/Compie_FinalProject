resource "aws_lb" "test" {
  name               = "Masteroll"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  
  subnet_mapping {
    subnet_id     = aws_subnet.masteroll-private-1.id
   
  }

  subnet_mapping {
    subnet_id     = aws_subnet.masteroll-private-2.id
    
  }

  enable_deletion_protection = true

  access_logs {
    bucket  = aws_s3_bucket.lb_logs.bucket
    prefix  = "test-lb"
    enabled = true
  }

  tags = {
    Environment = "production"
  }
}