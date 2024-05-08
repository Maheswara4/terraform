resource "aws_instance" "db_creation" {
    count= 3
    ami ="ami-090252cbe067a9e58"
    vpc_security_group_ids =[aws_security_group.allow_ssh.id]
    instance_type = "t2.micro"
    tags = {
        Name = var.instance_name[count.index]
  }
}

# resource resource_type resource_name
resource "aws_security_group" "allow_ssh" {
    name="allow_ssh"
    description = "allow ssh access"
    # this is block
    ingress { #inbond security group
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }
    egress {  #outbond of security group
        from_port        = 0 # 0 means all ports
        to_port          = 0
        protocol         = "-1"  #-1 means all protocols
        cidr_blocks      = ["0.0.0.0/0"]
    }


    tags = {
        Name = "allow_ssh"
        createdBy="MaheswaraReddy"
  }
    
}

