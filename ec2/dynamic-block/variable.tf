variable "inbond_rule" {
    type = list
    default = [
        {
            port= 22
            protocol= "tcp"
            allow_cidr=["0.0.0.0/0"]
        },
        {
            port= 80
            protocol= "tcp"
            allow_cidr=["0.0.0.0/0"]
        },
        {
            port= 8080
            protocol= "tcp"
            allow_cidr=["0.0.0.0/0"]
        },{
            port= 3306
            protocol= "tcp"
            allow_cidr=["0.0.0.0/0"]
        },

    ]
  
}