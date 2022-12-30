variable "web_server_instance_type" {
  default = "t2.micro"
}

variable "app_server_instance_type" {
  default = "t2.micro"
}

#Could use 'data' block to fetch it, but hard-coding it for now to keep it simple
variable "web_server_instance_ami" {
  default = "ami-0cff7528ff583bf9a"
}

variable "app_server_instance_ami" {
  default = "ami-0cff7528ff583bf9a"
}

variable "ec2_key" {
    default = "myKey"
}

variable "access_key" {
  default = "abcdefghfkfhkfkffhkfhk"
}

variable "secret_key" {
  default = "gdsggsfsfsfsffsfsfsfsf"
}