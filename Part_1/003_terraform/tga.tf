resource "aws_lb_target_group_attachment" "TGA" {
  target_group_arn = aws_lb_target_group.masterol-target-group.arn
  target_id        = [aws_instance.WebServer1.id, aws_instance.WebServer2.id]
  depends_on       = [aws_instance.WebServer1, aws_instance.WebServer2]
  port             = 80
}