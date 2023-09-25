terraform {

  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "4.61.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"

}

resource "aws_lightsail_instance" "test_server" {
    name = "test-server"
    availability_zone = "us-east-1a"
    blueprint_id = "centos_7"
    bundle_id = "nano_2_0"
    key_pair_name = "week4"

    user_data = <<-EOF
    sudo yum update -y 
    sudo yum install unzip wget httpd -y  ( apt install wget unzip -y )
    sudo wget https://github.com/utrains/static-resume/archive/refs/heads/main.zip
    sudo unzip main.zip
    sudo cp -r static-resume-main/* /var/www/html/  
    sudo systemctl start httpd
    sudo systemctl enable httpd 
    EOF
  
}
