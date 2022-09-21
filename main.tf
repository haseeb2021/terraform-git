##how to fetch data from Aws ##
#Data source codes, tested works
#feteched SG, Subnet id of the instance created in aws.
################




resource "aws_instance" "ec2_haseeb" {
ami = "ami-0c1bc246476a5572b"
instance_type = "t2.micro"
subnet_id = "subnet-08a054583e9ff3df2"
tags = {
   "name" = "haseeb ec2"
}
}



data "aws_instance" "ec2_haseeb" {
    filter {
        name = "tag:name"
      values = ["terraform ec2"]
    }
depends_on = [
  aws_instance.ec2_haseeb
]  
}



output "fetch_info_from_aws" {
    value = aws_instance.ec2_haseeb.subnet_id
  
}



output "fetch_info_from_aws2" {
    value = aws_instance.ec2_haseeb.vpc_security_group_ids
  
}