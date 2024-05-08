resource "aws_instance" "db_creation" {
    ami = var.image_id
    instance_type = var.instance_name == "db"? "t2.micro":"t2.small"
    
    
}


