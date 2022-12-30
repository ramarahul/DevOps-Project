# Create a NAT gateway
resource "aws_nat_gateway" "devops_project_nat_gateway" {
  allocation_id = aws_eip.devops_project_eip.id
  subnet_id     = aws_subnet.devops_project_public_subnet_1.id
}