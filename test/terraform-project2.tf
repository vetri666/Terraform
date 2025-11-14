#block1-the catalog
#we tell terraform that we are going to use aws
#inthe avail zone "us-est-1"

terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 4.0"
        }
    }
}

provider "aws" {
    region = "us-east-1"
}

#block 2 - The items in the catalog
# this is going to tell AWS to create ''aws instance'' ( a server)

resource "aws_instance" "my_web_server" {

    # these are the otion for our item 

#option 1: the "model"
# we want the Amazon Linux 2 model.

ami  = "ami-053b0d53c279acc90"

#option 2: the "size", we wan the t3 micro that is free tier

instance_type = "t3.micro"

#option 3: the "gift tag"
# we shall put a name tag on it so we can find it
tags = {
    Name = "My-first-scripted-server"
}

}