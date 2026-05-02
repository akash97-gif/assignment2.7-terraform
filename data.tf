data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["ce-learner-vpc"] # to be replaced with your VPC name
  }
}

data "aws_subnets" "example" {
  filter {
    name   = "tag:Name"
    values = ["ce-learner-vpc-public-ap-southeast-1b"]
  }
  
  filter {
    name   = "availability-zone"
    values = ["ap-southeast-1b"]
  }
}