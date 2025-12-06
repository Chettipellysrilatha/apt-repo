resource "aws_autoscaling_group" "asg" {
  name                = "devops-asg"
  desired_capacity    = 2
  max_size            = 3
  min_size            = 1

  vpc_zone_identifier = module.vpc.private_subnets

  launch_template {
    id      = aws_launch_template.lt.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.tg.arn]

  health_check_type = "EC2"
}
