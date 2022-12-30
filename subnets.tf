resource "aws_subnet" "devops_project_public_subnet_1" {
  vpc_id     = aws_vpc.devops_project_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "devops_project_public_subnet_1"
  }
}

resource "aws_subnet" "devops_project_public_subnet_2" {
  vpc_id     = aws_vpc.devops_project_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "devops_project_public_subnet_2"
  }
}

resource "aws_subnet" "devops_project_private_subnet_web_1" {
  vpc_id     = aws_vpc.devops_project_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "devops_project_private_subnet_web_1"
  }
}

resource "aws_subnet" "devops_project_private_subnet_web_2" {
  vpc_id     = aws_vpc.devops_project_vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "devops_project_private_subnet_web_2"
  }
}
resource "aws_subnet" "devops_project_private_subnet_app_1" {
  vpc_id     = aws_vpc.devops_project_vpc.id
  cidr_block = "10.0.5.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "devops_project_private_subnet_app_1"
  }
}
resource "aws_subnet" "devops_project_private_subnet_app_2" {
  vpc_id     = aws_vpc.devops_project_vpc.id
  cidr_block = "10.0.6.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "devops_project_private_subnet_app_2"
  }
}
resource "aws_subnet" "devops_project_private_subnet_db_1" {
  vpc_id     = aws_vpc.devops_project_vpc.id
  cidr_block = "10.0.7.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "devops_project_private_subnet_db_1"
  }
}

resource "aws_subnet" "devops_project_private_subnet_db_2" {
  vpc_id     = aws_vpc.devops_project_vpc.id
  cidr_block = "10.0.8.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "devops_project_private_subnet_db_2"
  }
}