variable "instance_names" {
  type = map
  default = {
    db="t2.micro"
    backend="t2.small"
    frontend="t2.small"
  }
}

variable "common_tags" {
    type = map
    default = {
        Project = "Expense"
        Terraform = "true"
    }
}

variable "zone_id" {
  default = "Z10234561HDWH6Y8DJQ1O"
}
variable "domain_name" {
  default = "devops4.cloud"
}