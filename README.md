# Author 
Name: Anit Singh
Email: anitsing@yahoo.com

# About
This project will create one EC2_Instance and install Jenkins, and Create Security group for Successfully access jenkins and provide you IP address of ec2 instance
you can access jenkins by http://"yourEC2-IP":8080  

Before use terraform please install terraform and aws cli and configure both then follow the steps

1. Clone this repo
2. change terraform.tfvars
   ami_value = "ami-08e5424edfe926b43" # provide the ami id 
   instance_type = "t2.micro"  # provide instance type
   subnet_id_value = "subnet-0cef51e26a0fc62c3" # choose subnet id
   access_key_name = "DevOps"    choose one access key from your list

3. run following commands
   terraform init
   terraform plan
   terraform apply

4. When you done don't forget to run following command
    terraform destroy

    Thanks
