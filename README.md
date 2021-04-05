# Terraform_EC2_Apache
Terraform script to create an Ec2 instance,Apache and feeding data into the webserver 

Initial requirements:
# Choose the cloud provider
specify region,access_key and secret key (In a live environment it is always advised to store your credentials in "/Users/tf_user/.aws/creds)

#Creating security group and allowing SSH and HTTP as we are deploying a webserver on Port : 80

# Creating an AWS Ec2 instance 
Specify AMI ID as per the region mentioned
choose the instance type
