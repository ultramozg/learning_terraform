### This is just my learning path to get familiar with terraform and how it's works

#### 01 section 
There nothing special just follows the tutorial [link](https://docs.microsoft.com/en-us/azure/developer/terraform/create-linux-virtual-machine-with-infrastructure) 

#### 02 section
 - Create an instance which allows connection to the standart ssh port & http-alt
 - Launch the simple http server on the port 8080

#### 03 section
 - As you already know the same virtual machines imagees on the different availability zones have different `AMI`, so to negeciate this problem we should query the `AWS` or `AZURE` API to get correct id of thoose images.
 - Add LB 
 - Add autoscaling group
 - Remove public ip's from instances, the application in our case it's nginx can be only reached via `elb`
 - instances in local subnet can reach the internet via `nat-gw` 

 Usefull article to do this [link](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Scenario2.html), [link2](https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-security-groups.html)

#### 04 section
 - The 4th section covers `AWS codedeploy` and how it's works, here link to the [tutorial](https://docs.aws.amazon.com/codedeploy/latest/userguide/tutorials-wordpress-launch-instance.html)

#### 05 section
 - The 5th section coverts how to provision a k8s cluster iniside Azure

#### 06 section
 - The 6th section discover how to user terraform import command, when resources already exists , for example k8s service like AKS :)

#### 07 section
 - The 7th section contains examples how to configure and provision `Service Bus Namespace` and queues services.

#### 08 section
  - The 8th section contains the service bus module which has ability to configure Geo-Redundant recovery

#### TIPS

To run terraform within `AWS` cloud provider, use something like this

```bash
AWS_ACCESS_KEY_ID=<access_key> AWS_SECRET_ACCESS_KEY=<secret_key> terraform destroy
```

in `azure`

```bash
ARM_ACCESS_KEY=<acces_key> ARM_CLIENT_SECRET=<client_secret> terraform plan
```

To install `aws codedeploy` use something like this

```bash
sudo apt install ruby wget -y
cd /home/ubuntu

wget https://aws-codedeploy-us-east-2.s3.us-east-2.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
sudo service codedeploy-agent start
```
