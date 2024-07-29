resource "aws_instance" "db_creation" {
  for_each = var.instance_names
    ami ="ami-090252cbe067a9e58"
    vpc_security_group_ids =["sg-067b4097cd2231981"]
    instance_type = each.value
    tags = {
        Name = each.key
  }
}