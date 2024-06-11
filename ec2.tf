5# Create an EC2 with Nginx installed
resource "aws_instance" "nginx" {
  ami                    = "ami-#####"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private_subnet.id
  associate_public_ip    = false
  key_name               = "svc_ssh_key_name"

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y nginx
              systemctl start nginx
              systemctl status nginx
              EOF

  tags = {
    Name = "nginx-instance"
  }

  # Allow traffic from NLB
  security_groups = [aws_security_group.nlb.id]
}
