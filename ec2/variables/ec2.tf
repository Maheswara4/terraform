resource "aws_instance" "db_creation" {
    ami = var.image_id
    vpc_security_group_ids =[aws_security_group.allow_ssh.id]
    instance_type = var.instance_type
    #left  side thing is argument and right side values
    
    tags = var.tags
}

# resource resource_type resource_name
resource "aws_security_group" "allow_ssh" {
    name=var.sg_name
    description = var.sg_description
    ingress { #inbond security group
        from_port        = var.shh_port
        to_port          = var.shh_port
        protocol         = var.protocol
        cidr_blocks      = var.allow_CIDR
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

