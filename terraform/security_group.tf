resource "aws_security_group" "acesso_project" {
  name = "acesso_projectt"
  vpc_id = aws_vpc.project_vpc.id
  ingress{
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }
  ingress{
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    from_port = 80
    to_port = 80
    protocol = "tcp"
  }
    ingress{
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    from_port = 443
    to_port = 443
    protocol = "tcp"
    }
  egress{
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    from_port = 0
    to_port = 0
    protocol = "-1"
  }
  tags = {
    Name = "acesso_project"
  }
}
resource "aws_security_group" "project_win" {
  name = "project_win"
  vpc_id = aws_vpc.project_vpc.id
  ingress{
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    from_port = 80
    to_port = 80
    protocol = "tcp"
  }
  ingress{
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    from_port = 443
    to_port = 443
    protocol = "tcp"
  }
  ingress{
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    from_port = 5985
    to_port = 5986
    protocol = "tcp"
  }
   ingress{
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    from_port = 3389
    to_port = 3389
    protocol = "tcp"
  }
   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}