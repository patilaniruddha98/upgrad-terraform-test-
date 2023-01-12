module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami                    = "ami-06878d265978313ca"
  instance_type          = "t2.micro"
  key_name               = "upgrad"
  monitoring             = true
  vpc_security_group_ids = [module.test_service_sg.security_group_id]
  subnet_id              = [module.vpc.public_subnets]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}