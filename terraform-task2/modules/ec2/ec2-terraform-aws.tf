resource "aws_instance" "newec2-v1" {
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
    source      = "${path.module}/password.txt"
    destination = "/home/ubuntu/password.txt"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("${path.module}/terrv1.pem")
      host        = self.public_ip
    }
  }

  tags = {
    Name = "terraform-instances-1"
  }
}

# resource "aws_instance" "newec2-v2" {
#   ami                    = var.ami_id
#   instance_type          = lookup(var.instance_type, terraform.workspace)
#   # subnet_id              = aws_subnet.dev-subnet-public[1].id
#   key_name               = var.key_name
#   vpc_security_group_ids = [aws_security_group.sg-terraform.id]
#   user_data = file("${path.module}/apache_install.sh")
#   connection {
#     type        = "ssh"
#     user        = "ubuntu"
#     private_key = file("${path.module}/terr.pem")
#     host        = self.public_ip
#   }

#   provisioner "file" {
#     source      = "${path.module}/mysql-connection.php"
#     destination = "/home/ubuntu/mysql-connection.php"

#     connection {
#       type        = "ssh"
#       user        = "ubuntu"
#       private_key = file("${path.module}/terr.pem")
#       host        = self.public_ip
#     }
#   }
#     provisioner "file" {
#     source      = "${path.module}/username.txt"
#     destination = "/home/ubuntu/username.txt"

#     connection {
#       type        = "ssh"
#       user        = "ubuntu"
#       private_key = file("${path.module}/terr.pem")
#       host        = self.public_ip
#     }
#   }
#     provisioner "file" {
#     source      = "${path.module}/password.txt"
#     destination = "/home/ubuntu/password.txt"

#     connection {
#       type        = "ssh"
#       user        = "ubuntu"
#       private_key = file("${path.module}/terr.pem")
#       host        = self.public_ip
#     }
#   }

#   tags = {
#     Name = "terraform-instances-2"
#   }
# }
# output "check" {
#   value = aws_subnet.dev-subnet-private
# }

# output "env_check" {
#   value = var.password
# }