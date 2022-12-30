resource "aws_vpc" "devops_project_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "devops_project_vpc"
  }
}