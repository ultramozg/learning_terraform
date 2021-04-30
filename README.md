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