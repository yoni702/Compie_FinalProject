resource "aws_instance" "Ansible-Controller" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  
  # the VPC subnet
  subnet_id = aws_subnet.masteroll-public-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # the public SSH key
  key_name      = aws_key_pair.mykey.key_name
  
  provisioner "local-exec" {
    command = "echo -e '[all] \n${aws_instance.WebServer1.private_ip} \n${aws_instance.WebServer2.private_ip}' >> inventory"
  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.WebServer1.private_ip} >> inventory1"
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.WebServer2.private_ip} >> inventory1"
  }
  
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "file" {
    source      = "inventory"
    destination = "/home/ubuntu/inventory"
  }
  
  provisioner "file" {
    source      = "mykey"
    destination = "/home/ubuntu/mykey"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo sed -i -e 's/\r$//' /tmp/script.sh", # Remove the spurious CR characters.
      "sudo /tmp/script.sh",
      "chmod 400 /home/ubuntu/mykey",
    ]
  }
  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }
    tags = {
    Name = "Ansible-Controller"
  }
}


resource "aws_instance" "WebServer1" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.masteroll-private-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # the public SSH key
  key_name = aws_key_pair.mykey.key_name

  tags = {
    Name = "WebServer1"
  }
}

resource "aws_instance" "WebServer2" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.masteroll-private-2.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # the public SSH key
  key_name = aws_key_pair.mykey.key_name
  tags = {
    Name = "WebServer2"
  }
}


#IP of aws instance retrieved
output "ip-Ansible-Controller" {
  value = aws_instance.Ansible-Controller.public_ip
}
#IP of aws instance retrieved
output "ip-WebServer1" {
  value = aws_instance.WebServer1.private_ip
}
#IP of aws instance retrieved
output "ip-WebServer2" {
  value = aws_instance.WebServer2.private_ip
}