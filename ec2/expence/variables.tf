#ec2 instance variable
variable "instance_names" {
    type = list
    default = ["db","backend","frontend"]
}
variable "image_id" {
    type = string
    default = "ami-090252cbe067a9e58"
    description = "RHEL-9 ami image id"
}
variable "instance_type" {
    default = "t2.micro"
    type = string 
}
variable "common_tags" {
    default = {
        project= "expence"
        enviorment= "DEV"
        terraform = true
    }
}

#security variable
variable "sg_name" {
    default = "ssh_allow"
  
}
variable "sg_description" {
    default = "allow ssh port 22"
  
}
variable "shh_port" { 
    default = 22
}
variable "protocol" {
    default = "tcp"
}
variable "allow_CIDR" {
    type=list(string)
    default = ["0.0.0.0/0"]
  
}

#route 53 variable
variable "zone_id" {
  default = "Z10234561HDWH6Y8DJQ1O"
}
variable "domain_name" {
  default = "devops4.cloud"
}