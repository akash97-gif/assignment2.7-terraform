resource "aws_volume_attachment" "ebs_att" {
  device_name = "madhu/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.public.id
}

resource "aws_instance" "public" {
  ami               = "ami-0a84a03957476a2cc"
  instance_type     = "t2.micro"
  subnet_id         = data.aws_subnets.example.id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
}

resource "aws_security_group" "allow_ssh" {
  name        = "madhu-sg-ec2" #Security group name, e.g. jazeel-terraform-security-group
  description = "Allow SSH inbound"
  vpc_id      = "vpc-06c77214cf4463d82" #VPC ID (Same VPC as your EC2 subnet above), E.g. vpc-xxxxxxx

  tags = {
    Name = "madhu-ec2-dev-1"
  }
}

resource "aws_ebs_volume" "example" {
  availability_zone = "ap-southeast-1b"
  size              = 1
}