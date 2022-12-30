resource "aws_route_table" "devops_project_public_rt" {
  vpc_id = aws_vpc.devops_project_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.devops_project_ig.id
  }
    tags = {
    Name = "devops_project_public_rt"
  }
}

resource "aws_route_table" "devops_project_private_web_server_rt" {
  vpc_id = aws_vpc.devops_project_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.devops_project_nat_gateway.id
  }
    tags = {
    Name = "devops_project_private_web_server_rt"
  }
}

resource "aws_route_table" "devops_project_private_app_server_rt" {
  vpc_id = aws_vpc.devops_project_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.devops_project_nat_gateway.id
  }
    tags = {
    Name = "devops_project_private_app_server_rt"
  }
}

resource "aws_route_table" "devops_project_private_db_rt" {
  vpc_id = aws_vpc.devops_project_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.devops_project_nat_gateway.id
  }
    tags = {
    Name = "devops_project_private_db_rt"
  }
}

# Associate public subnets with route table
resource "aws_route_table_association" "devops_project_public_route_1" {
  subnet_id      = aws_subnet.devops_project_public_subnet_1.id
  route_table_id = aws_route_table.devops_project_rt.id
}

resource "aws_route_table_association" "devops_project_public_route_2" {
  subnet_id      = aws_subnet.devops_project_public_subnet_2.id
  route_table_id = aws_route_table.devops_project_rt.id
}

# Associate the private subnet with the private route table
resource "aws_route_table_association" "devops_project_web_private_route_1" {
  subnet_id      = aws_subnet.devops_project_private_subnet_web_1.id
  route_table_id = aws_route_table.devops_project_private_web_server_rt.id
}

resource "aws_route_table_association" "devops_project_web_private_route_2" {
  subnet_id      = aws_subnet.devops_project_private_subnet_web_2.id
  route_table_id = aws_route_table.devops_project_private_web_server_rt.id
}

resource "aws_route_table_association" "devops_project_app_private_route_1" {
  subnet_id      = aws_subnet.devops_project_private_subnet_app_1.id
  route_table_id = aws_route_table.devops_project_private_app_server_rt.id
}

resource "aws_route_table_association" "devops_project_app_private_route_2" {
  subnet_id      = aws_subnet.devops_project_private_subnet_app_2.id
  route_table_id = aws_route_table.devops_project_private_app_server_rt.id
}

resource "aws_route_table_association" "devops_project_db_private_route_1" {
  subnet_id      = aws_subnet.devops_project_private_subnet_db_1.id
  route_table_id = aws_route_table.devops_project_private_db_rt.id
}

resource "aws_route_table_association" "devops_project_db_private_route_2" {
  subnet_id      = aws_subnet.devops_project_private_subnet_db_2.id
  route_table_id = aws_route_table.devops_project_private_db_rt.id
}