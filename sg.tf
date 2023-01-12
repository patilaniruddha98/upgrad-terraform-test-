module "test_service_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "test-sg-service"
  description = "Security group for user-service with custom ports open within VPC, and PostgreSQL publicly open"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
       from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "ssh"
      cidr_blocks = "0.0.0.0/0" 
    }
  ]
   
   egress_rules = ["all-all"]
  tags = {
    Name = "ani_allow_ssh"
  }
}
