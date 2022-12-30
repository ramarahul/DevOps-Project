# Create ec2 instances
resource "aws_instance" "devops_project_web_server_1" {
  ami           = var.app_server_instance_ami
  instance_type = var.web_server_instance_type
  key_name          = var.ec2_key
  availability_zone = "us-east-1a"
  vpc_security_group_ids = [aws_security_group.devops_project_web_server_sg.id]
  subnet_id = aws_subnet.devops_project_private_subnet_web_1.id
  user_data = "${file("web.sh")}"

  tags = {
    Name = "devops_project_web_server_1_instance"
  }
}

resource "aws_instance" "devops_project_web_server_2" {
  ami           = var.app_server_instance_ami
  instance_type = var.web_server_instance_type
  key_name          = "MyKey"
  availability_zone = "us-east-1b"
  vpc_security_group_ids      = [aws_security_group.devops_project_web_server_sg.id]
  subnet_id                   = aws_subnet.devops_project_private_subnet_web_2.id
  user_data = "${file("web.sh")}"

  tags = {
    Name = "devops_project_web_server_2_instance"
  }
}

resource "aws_instance" "devops_project_app_server_1" {
  ami           = var.app_server_instance_ami
  instance_type = var.app_server_instance_type
  key_name          = var.ec2_key
  availability_zone = "us-east-1a"
  vpc_security_group_ids      = [aws_security_group.devops_project_app_server_sg.id]
  subnet_id                   = aws_subnet.devops_project_private_subnet_app_1.id
  user_data = "${file("app.sh")}"

  tags = {
    Name = "devops_project_app_server_2_instance"
  }
}

resource "aws_instance" "devops_project_app_server_2" {
  ami           = var.app_server_instance_ami
  instance_type = var.app_server_instance_type
  key_name          = var.ec2_key
  availability_zone = "us-east-1b"
  vpc_security_group_ids      = [aws_security_group.devops_project_app_server_sg.id]
  subnet_id                   = aws_subnet.devops_project_private_subnet_app_2.id
  user_data = "${file("app.sh")}"

  tags = {
    Name = "devops_project_app_server_2_instance"
  }
}