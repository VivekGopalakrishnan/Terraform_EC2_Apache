provider "aws" {
        region = "ap-south-1"
        access_key = ""
        secret_key = ""
}

#Creating security group and allowing SSH and HTTP

resource "aws_security_group" "webpage-terra-ssh-http" {
        name = "webpage-terra-ssh-http"
        description = "allowing ssh and http traffic" 

        ingress {
                from_port = 22
                to_port = 22
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
        }
        
        ingress {
                from_port = 80
                to_port = 80
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
       }
    
       egress {
                from_port = 0
                to_port = 0
                protocol = "-1"
                cidr_blocks = ["0.0.0.0/0"]
        }         
}
# Closing the security group here

# Creating an AWS Ec2 instance 

resource "aws_instance" "webpage-terra" {
        ami = "ami-0bcf5425cdc1d8a85"
        instance_type = "t2.micro"
        availability_zone = "ap-south-1a"
        security_groups = ["${aws_security_group.webpage-terra-ssh-http.name}"]
        key_name = "Viv2"
        user_data = <<-EOF
                 #! /bin/bash
                 sudo yum install httpd -y
                 sudo systemctl start httpd
                 sudo systemctl enable httpd
                 echo "<h1>Creation of a web server on terraform<br>version 1.0.0.0.1<h1>" >> /var/www/html.index.html
         EOF
         
         tags = {
                  Name = "webserver"
                  }

}
