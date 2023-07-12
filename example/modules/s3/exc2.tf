resource "aws_instance" "app_server" {
  for_each = var.ec2s
  ami           = each.value["ami"] 
  instance_type = each.value["instancetype"] 
  tags     = each.value["tags"]
}

