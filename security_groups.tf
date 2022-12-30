resource "aws_security_group" "devops_project_alb_sg" {
  name = "devops_project_alb_sg"
  description = "Security group for internet facing Application Load balancer"
  vpc_id = aws_vpc.devops_project_vpc
  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "devops_project_bastion_sg" {
  name = "devops_project_bastion_sg"
  description = "Security group for bastion host"
  vpc_id = aws_vpc.devops_project_vpc
  ingress {
    from_port         = 22
    to_port           = 22
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"] # A bit unsafe, but leaving it like this for simplicity
  }
}

resource "aws_security_group" "devops_project_web_server_sg" {
  name = "devops_project_web_server_sg"
  description = "Security group for internet facing Application Load balancer"
  vpc_id = aws_vpc.devops_project_vpc
  
  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.devops_project_bastion_sg.id]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [aws_security_group.devops_project_alb_sg.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "devops_project_app_server_sg" {
  name = "devops_project_app_server_sg"
  description = "Security group for App server"
  vpc_id = aws_vpc.devops_project_vpc
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = [aws_security_group.devops_project_web_server_sg.id]
  }

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.devops_project_bastion_sg.id]
  }
}

resource "aws_security_group" "devops_project_db_sg" {
  name = "devops_project_db_sg"
  description = "Security group for RDS Postgres DB"
  vpc_id = aws_vpc.devops_project_vpc
  ingress {
    from_port = 5432
    to_port = 5432
    protocol = "tcp"
    cidr_blocks = [aws_security_group.devops_project_app_server_sg.id]
  }
}

resource "aws_security_group" "devops_project_bastion_sg" {
  name = "devops_project_bastion_sg"
  description = "Security group for bastion host"
  vpc_id = aws_vpc.devops_project_vpc
  ingress {
    from_port         = 22
    to_port           = 22
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"] # A bit unsafe, but leaving it like this for simplicity
  }
}