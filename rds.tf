resource "aws_db_subnet_group" "devops_project_rds_subnet_group" {
  name        = "devops_project_rds_subnet_group"
  subnet_ids  = [aws_subnet.devops_project_private_subnet_db_1.id, aws_subnet.devops_project_private_subnet_db_2.id]
}

resource "aws_rds_cluster" "devops_project_rds_cluster" {
  cluster_identifier = "devops_project_rds_cluster"
  engine = "aurora-postgresql"
  engine_version = "11.13"
  availability_zones = ["us-east-1a", "us-east-1b"]
  database_name = "devops_project_postgres_db"
  master_username = "username"
  master_password = "password"
  skip_final_snapshot = true
  vpc_security_group_ids = [aws_security_group.devops_project_db_sg.id]
  db_subnet_group_name = aws_db_subnet_group.devops_project_rds_subnet_group.name
  publicly_accessible = false
}

resource "aws_rds_cluster_instance" "devops_project_rds_cluster_instance" {
  cluster_identifier = aws_rds_cluster.devops_project_rds_cluster.id
  instance_class = "db.t3.micro"
  identifier = "devops_project_rds_cluster_instance"
  engine = "aurora-postgresql"
  engine_version = "11.13"
  vpc_security_group_ids = [aws_security_group.devops_project_db_sg.id]
  publicly_accessible = false
  skip_final_snapshot = true
}