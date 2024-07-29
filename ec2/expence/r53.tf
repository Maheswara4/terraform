resource "aws_route53_record" "expense" {
  count = length(var.instance_names)
  zone_id = var.zone_id
  #if frontend devops4.cloud --> public ip
  #otherwise db/backend.devops4.cloud --> private ip
  name    = var.instance_names[count.index]== "frontend" ? var.domain_name : "${var.instance_names[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = var.instance_names[count.index]== "frontend" ?[aws_instance.expence[count.index].public_ip]:[aws_instance.expence[count.index].private_ip]
  allow_overwrite = true # if already records exist it can use
}