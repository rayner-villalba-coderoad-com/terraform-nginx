resource "aws_instance" "nginx-server2" {
  ami = "ami-0453ec754f44f9a4a"  # agrega el ami Amazon Linux de acuerdo a tu region
  instance_type = "t2.micro"

  tags = {
    Name = "Upb-Nginx2"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo yum install -y nginx
              sudo systemctl enable nginx
              sudo systemctl start nginx
              EOF
  user_data_replace_on_change = true
  key_name = aws_key_pair.nginx-server-ssh.key_name
  vpc_security_group_ids = [ aws_security_group.nginx-server-sg.id ]
}