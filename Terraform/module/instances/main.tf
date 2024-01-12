resource "aws_instance" "web" {
  count = var.instance_count
  ami = "ami-0c7643a7975c32a16"  
  instance_type = "t2.micro"
  subnet_id = element(var.subnet_ids, count.index)
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = "Terraform-Test-Instance-${count.index + 1}"
  }
}

output "instance_ids" {
  value = aws_instance.web.*.id
}
