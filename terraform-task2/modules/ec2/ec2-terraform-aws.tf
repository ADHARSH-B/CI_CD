resource "aws_instance" "ec2_machine" {
  ami                    = var.ec2_ami
  instance_type          = var.ec2_type
  count                  = var.ec2_count
  subnet_id              = var.subnet_ids[0]
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.sg-terraform.id]
  user_data              = file("${path.module}/apache_install.sh")
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${path.module}/terrv1.pem")
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "${path.module}/mysql-connection.php"
    destination = "/home/ubuntu/mysql-connection.php"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("${path.module}/terrv1.pem")
      host        = self.public_ip
    }
  }
  provisioner "file" {
    source      = "${path.module}/username.txt"
    destination = "/home/ubuntu/username.txt"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("${path.module}/terrv1.pem")
      host        = self.public_ip
    }
  }
  provisioner "file" {
    content     = templatefile("${path.module}/rds.txt.tpl", { db_host = var.rds_endpoint })
    destination = "/home/ubuntu/rds_endpoint.txt"
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("${path.module}/terrv1.pem")
      host        = self.public_ip
    }
  }

  provisioner "file" {
    source      = "${path.module}/password.txt"
    destination = "/home/ubuntu/password.txt"

    # connection {
    #   type        = "ssh"
    #   user        = "ubuntu"
    #   private_key = file("${path.module}/terrv1.pem")
    #   host        = self.public_ip
    # }
  }

  tags = {
    Name = "terraform-instances-${count.index}"
  }
}
