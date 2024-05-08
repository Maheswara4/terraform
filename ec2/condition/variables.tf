variable "image_id" {
    type = string
    default = "ami-090252cbe067a9e58"
    description = "RHEL-9 ami image id"
}
variable "instance_type" {
    default = "t2.micro"
    type = string 
}
variable "instance_name" {
    default = "backend"
  
}