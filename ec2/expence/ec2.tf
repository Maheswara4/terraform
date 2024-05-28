resource "aws_instance" "expence" {
    count= length(var.instance_name)
    ami =var.image_id
    vpc_security_group_ids =[aws_security_group.allow_ssh.id]
    instance_type = var.instance_name[count.index]== "db" ? "t2.small" : "t2.micro"
    tags =merge(
        var.common_tags,{
            name=var.instance_name[count.index]
            module= var.instance_name[count.index]

        }
    )
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

