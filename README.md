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

#### TIPS

To run terraform within `AWS` cloud provider, use something like this

```bash
AWS_ACCESS_KEY_ID=<access_key> AWS_SECRET_ACCESS_KEY=<secret_key> terraform destroy
```

in `azure`

```bash
ARM_ACCESS_KEY=<acces_key> ARM_CLIENT_SECRET=<client_secret> terraform plan
```