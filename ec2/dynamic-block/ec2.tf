resource "aws_security_group" "allow_port" {
    name="allow_port"
    description = "allow port 22,80,8080,3306"

    # this is block
    dynamic "ingress" { #inbond security group
        for_each = var.inbond_rule
        content {
            from_port        = ingress.value["port"]
            to_port          = ingress.value["port"]
            protocol         = ingress.value["protocol"]
            cidr_blocks      = ingress.value["allow_cidr"]
        }
    }
    egress {  #outbond of security group
        from_port        = 0 # 0 means all ports
        to_port          = 0
        protocol         = "-1"  #-1 means all protocols
        cidr_blocks      = ["0.0.0.0/0"]
    }


    tags = {
        Name = "allow_cidr"
        createdBy="MaheswaraReddy"
    }
}
