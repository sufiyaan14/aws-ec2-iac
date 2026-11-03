resource "aws_instance" "myfirstec2" {
  ami           = var.ubuntu26_mumbai_ami_id
  instance_type = var.instance_type
  subnet_id     = data.aws_subnet.dev-ec2-pub-01.id
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.myfirstsg.id, data.aws_security_group.dev-myip-sg.id]

  associate_public_ip_address = true

  user_data = file("${path.module}/scripts/nginx.sh")

  root_block_device {
    volume_size           = 15
    volume_type           = "gp3"
    encrypted             = true
    delete_on_termination = true
  }

  tags = {
    Name = "${local.name_prefix}-terraform-EC2"
  }
}

resource "aws_security_group" "myfirstsg" {
  name        = "${local.name_prefix}-${var.sg_name}"
  description = "Terraform SG"
  vpc_id      = data.aws_vpc.dev-vpc.id
  tags = {
    Name = "${local.name_prefix}-${var.sg_name}"
  }
}

resource "aws_vpc_security_group_ingress_rule" "myfirstsg-ing" {
  security_group_id = aws_security_group.myfirstsg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}
resource "aws_vpc_security_group_ingress_rule" "myfirstsg-ing1" {
  security_group_id = aws_security_group.myfirstsg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
}
