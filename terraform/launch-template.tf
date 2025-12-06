data "aws_ami" "amazon_linux" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_launch_template" "lt" {
  name_prefix   = "devops-lt"
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_profile.name
  }

  user_data = filebase64("${path.module}/user-data.sh")

  network_interfaces {
    security_groups = [aws_security_group.ec2_sg.id]
  }
}
