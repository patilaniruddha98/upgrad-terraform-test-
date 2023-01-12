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
   egress_with_cidr_blocks = [ {
    from_port        = 0
    to_port          = 0    
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
   ]
  tags = {
    Name = "ani_allow_ssg"
  }
}
