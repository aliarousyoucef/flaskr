
### Application

* Gunicorn is used as HTTP WSGI servers
* Nginx was chosen to serve static content and as a reverse proxy for Gunicorn
* Backend database is SQLite ( must be migrated but not done in this work )
* Flask as the application framework ( flaskr was written on top of flask)
* Systemd is used to start the application as service with system boot 
* Orchestration: terraform for AWS resource provisioning 
* Config management: ansible to install prerequisite, configure the application and all associated configuration 



### Ressource provisioning : 

Terraform is used as orchestration tools if you use other tools just change host address in ansible hosts file 

The code in terraform/ create an instance with Ubuntu 16.04 operating system and associated security group. This security group allows all outbound traffic and only ssh and TCP 8080 as inbound traffic.

#### Prerequisites 

To use this code you have to provide [AWS credential](https://www.terraform.io/docs/providers/aws/index.html) and change key pair name key_name in terraform/variables.tf. Optionally you can change  (region, AMI, instance_type, instance_count  )


To create resources, In Terraform folder execute:
```
terraform init 
terraform apply
```
The output will be provisioned instance IP address

### Deploiment 

Ansible is used for deployment. Ansible tasks are : 
- Install needed package 
- Create a python virtual environment and install gunicorn and flask
- Clone application from GitHub 
- Edit flaskr.py file to init database with WSGI request  ( not sure about my solution )
- Create WSGI.py file 
- Generate Nginx and systemd config files from a template file 
- Enable configuration and restart systemd  and Nginx 
	
	

#### Prerequisites

First edit hosts file with your hosts adresses. Also you have to change the user and the private key name in ansible.cfg . It's possible to change the number of  (wsgi_worker) and application port (app_port) in variable.yml 

Ansible version: tested with 2.8.1

To run the playbook :
```
ansible-playbook app.yml
```

After deployment application will be accessible at host_ip:app_port

