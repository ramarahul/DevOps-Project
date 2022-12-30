resource "aws_launch_template" "devops_project_web_server_launch_template" {
  instance_type          = var.web_server_instance_type
  image_id               = var.web_server_instance_ami
  vpc_security_group_ids = [aws_security_group.devops_project_web_server_sg]
  user_data              = "${file("web.sh")}"
  key_name               = var.ec2_key

  tags = {
    Name = "devops_project_web_server_launch_template"
  }
}

resource "aws_autoscaling_group" "devops_project_web_server_autoscaling_group" {
  name                = "devops_project_web_server_autoscaling_group"
  vpc_zone_identifier = [aws_subnet.devops_project_private_subnet_web_1.id, aws_subnet.devops_project_private_subnet_web_2.id ]
  min_size            = 2
  max_size            = 3
  desired_capacity    = 2

  target_group_arns = [aws_lb_target_group.devops_project_tg.arn]

  launch_template {
    id      = aws_launch_template.devops_project_web_server_launch_template.id
    version = "$Latest"
  }
}

resource "aws_launch_template" "devops_project_app_server_launch_template" {
  instance_type          = var.app_server_instance_type
  image_id               = var.app_server_instance_ami
  vpc_security_group_ids = [aws_security_group.devops_project_app_server_sg]
  user_data              = "${file("app.sh")}"
  key_name               = var.ec2_key

  tags = {
    Name = "devops_project_app_server_launch_template"
  }
}

resource "aws_autoscaling_group" "devops_project_app_server_autoscaling_group" {
  name                = "devops_project_app_server_autoscaling_group"
  vpc_zone_identifier = [aws_subnet.devops_project_private_subnet_app_1.id, aws_subnet.devops_project_private_subnet_app_2.id ]
  min_size            = 2
  max_size            = 3
  desired_capacity    = 2

  launch_template {
    id      = aws_launch_template.devops_project_app_server_launch_template.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_attachment" "devops_project_autoscaling_attachment" {
  autoscaling_group_name = aws_autoscaling_group.devops_project_web_server_autoscaling_group.id
  lb_target_group_arn    = aws_lb_target_group.devops_project_tg.arn
}