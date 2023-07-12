variable "ec2s" {
  type = map(object({
    ami     = string
    instancetype = string
    tags     = map(string)
  }))
  default = {
    "first" = {
      ami     = "fami-830c94e3"
      instancetype = "t2.micro"
      tags = {
        "owner"    = "vcloud-lab.com"
        "downtime" = "afternoon"
      }
    }
    "second" = {
      ami     = "ami-830c94e3"
      instancetype = "t2.micro"
      tags = {
        "owner"    = "vJanvi"
        "downtime" = "morning"
      }
    }
    "third" = {
      ami     = "ami-830c94e3"
      instancetype = "t2.micro"
      tags = {
        "owner"    = "abc"
        "downtime" = "gfgfgf"
      }
    }
    "four" = {
      ami     = "ami-830c94e3"
      instancetype = "t2.micro"
      tags = {
        "owner"    = "abc"
        "downtime" = "gfgfgf"
      }
    }
  }
}
 