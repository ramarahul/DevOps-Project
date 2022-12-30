# Allocate an Elastic IP for the NAT gateway
resource "aws_eip" "devops_project_eip" {
  vpc = true
}