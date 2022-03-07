
variable "vpcid" {
    type = string
    default = "vpc-6c235d11"
}

variable "amiid" {
    default = "ami-04ad2567c9e3d7893"
}

resource "aws_instance" "puppet01_instance" {
  ami           = "${var.amiid}"
  instance_type = "t2.micro"
  key_name = "DevOps-79"
  vpc_security_group_ids = ["sg-0e1837c2359e0d71b"]

  user_data = file("/root/Puppet/EC2-for-puppet/ec2_module/puppet-aget01-script.sh")

  provisioner "local-exec" {
    command = "echo ${self.private_ip} puppetagent01.example.com >> /tmp/private_ips_agent01.txt"
  
  } 
  tags = {
    Name = "puppet_agent01-terraform" 
  }
}

resource "aws_instance" "puppet02_instance" {
  ami           = "${var.amiid}"
  instance_type = "t2.micro"
  key_name = "DevOps-79"
  vpc_security_group_ids = ["sg-0e1837c2359e0d71b"]
  
  user_data = file("/root/Puppet/EC2-for-puppet/ec2_module/puppet-aget02-script.sh")
  provisioner "local-exec" {
    command = "echo ${self.private_ip} puppetagent02.example.com >> /tmp/private_ips_agent02.txt"
  
  } 
  
  tags = {
    Name = "puppet_agent02-terraform" 
  }
}

resource "aws_instance" "puppet_master_instance" {
  ami           = "ami-033b95fb8079dc481"
  instance_type = "t2.medium"
  key_name = "DevOps-79"
  vpc_security_group_ids = ["sg-0e1837c2359e0d71b"]

  user_data = file("/root/Puppet/EC2-for-puppet/ec2_module/puppet-master-script.sh")

  provisioner "local-exec" {
    command = "echo ${self.private_ip} puppetmaster.example.com >> /tmp/private_ip_master.txt"
  
  } 
  
  tags = {
    Name = "puppet_master-terraform" 
  }
}

# resource "aws_key_pair" "ssh-key" {
#     key_name = "server-key"
#     public_key = file("/root/.ssh/id_rsa.pub")
# }

