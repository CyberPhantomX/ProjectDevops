resource "aws_security_group" "ProjectdevOps-sg" {
  name        = "ProjectdevOps Security Group"
  description = "Open 22,443,80,8080,9090,3000"
  ingress = [
    	for port in [22,443,80,8080,9090,3000] : {
      description      = "TLS from VPC"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
  egress {
  	  from_port   = 0
    	to_port     = 0
   	 protocol    = "-1"
   	 cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "ProjectdevOps-sg"
  }
}
resource "aws_instance" "Jenkins" {
  ami                    = "ami-00c71bd4d220aa22a"  #change Ami if you different region
  instance_type          = "t2.micro"
  key_name               = "KeyPairJeremy"
  vpc_security_group_ids = [aws_security_group.ProjectdevOps-sg.id]
  user_data              = templatefile("./install_jenkins.sh", {})
  tags = {
    Name = "Jenkins"
  }
  root_block_device {
    volume_size = 8
  }
}

resource "aws_instance" "Prometheus-Grafana" {
  ami                    = "ami-00c71bd4d220aa22a"  #change Ami if you different region
  instance_type          = "t2.micro"
  key_name               = "KeyPairJeremy"
  vpc_security_group_ids = [aws_security_group.ProjectdevOps-sg.id]
  user_data              = templatefile("./install_prometheus_grafana.sh", {})
  tags = {
    Name = "Prometheus-Grafana"
  }
  root_block_device {
    volume_size = 8
  }
}

