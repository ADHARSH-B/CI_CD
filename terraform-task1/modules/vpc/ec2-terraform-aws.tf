resource "aws_instance" "newec2_v1" {
  count=2
  # ami                    = var.ami_id
  ami="${data.aws_ami.ubuntu.id}"
  instance_type          = lookup(var.instance_type, terraform.workspace)
  subnet_id              = aws_subnet.dev_subnet_public[count.index].id
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.sg_ec2_terraform.id]
  user_data = file("${path.module}/apache_install.sh")
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${path.module}/terrv1.pem")
    host        = self.public_ip
  }
  
  provisioner "file" {
    source      = "${path.module}/mysql-connection.php"
    destination = "/home/ubuntu/mysql-connection.php"

   
  }
  provisioner "file" {
    source      = "${path.module}/username.txt"
    destination = "/home/ubuntu/username.txt"

  }
    provisioner "file" {
    source      = "${path.module}/password.txt"
    destination = "/home/ubuntu/password.txt"
  }

  tags = {
    Name = "terraform-instances-${count.index}"
  }
}


